# encoding: UTF-8

require 'active_support/core_ext/object/blank'
require 'money'

module MoneyHelper

  SYMBOL_ONLY = %w{USD GBP EUR MYR TRY} #don't use ISO code
  OK_SYMBOLS = %w{
    $ £ € ¥ 元 р. L ƒ ৳ P R$ K ₡ D ლ ₵ Q G ₹ Rp ₪ ₩ ₭ R RM ₨ ₮ դր. C$ ₦ TL ₲ ₱ T ฿ T$ m ₴ ₫ ៛
  } #ok to include in string

  ##
  # Formats a single amount in the given currency into a price string. Defaults to USD if currency not
  #   given.
  #
  # = Example
  #
  #   $10,000; HKD $10,000 for (10000, "USD") and (10000, "HKD"), respectively
  #
  # = Arguments
  #
  #   amount: (Float)
  #   currency: (String)
  #   number_only: (Boolean) optional flag to exclude currency indicators (retains number formatting
  #     specific to currency)
  def self.money_to_text(amount, currency, number_only = false)
    return nil unless amount.present?
    currency = "USD" if currency.blank?
    symbol = symbol_for_code(currency)
    include_symbol = !number_only && symbol.present? && OK_SYMBOLS.include?(symbol)
    valid_currency = currency if code_valid?(currency)
    (number_only || SYMBOL_ONLY.include?(currency) ? "" : currency + " ") +
      parse_money(amount.ceil, valid_currency).format({
        no_cents: true,
        symbol_position: :before,
        symbol: include_symbol
      }).delete(' ')
  end

  # Parses the current string and converts it to a +Money+ object.
  # Excess characters will be discarded.
  #
  # @param [String, #to_s] input The input to parse.
  # @param [Currency, String, Symbol] currency The currency format.
  #   The currency to set the resulting +Money+ object to.
  #
  # @return [Money]
  #
  # @raise [ArgumentError] If any +currency+ is supplied and
  #   given value doesn't match the one extracted from
  #   the +input+ string.
  #
  # @example
  #   '100'.to_money                #=> #<Money @fractional=10000>
  #   '100.37'.to_money             #=> #<Money @fractional=10037>
  #   '100 USD'.to_money            #=> #<Money @fractional=10000, @currency=#<Money::Currency id: usd>>
  #   'USD 100'.to_money            #=> #<Money @fractional=10000, @currency=#<Money::Currency id: usd>>
  #   '$100 USD'.to_money           #=> #<Money @fractional=10000, @currency=#<Money::Currency id: usd>>
  #   'hello 2000 world'.to_money   #=> #<Money @fractional=200000 @currency=#<Money::Currency id: usd>>
  #
  # @example Mismatching currencies
  #   'USD 2000'.to_money("EUR")    #=> ArgumentError
  #
  # @see #from_string
  #
  def self.parse_money(input, currency = nil)
    i = input.to_s.strip

    # raise Money::Currency.table.collect{|c| c[1][:symbol]}.inspect

    # Check the first character for a currency symbol, alternatively get it
    # from the stated currency string
    c = if Money.assume_from_symbol && i =~ /^(\$|€|£)/
      case i
      when /^\$/ then "USD"
      when /^€/ then "EUR"
      when /^£/ then "GBP"
      end
    else
      i[/[A-Z]{2,3}/]
    end

    # check that currency passed and embedded currency are the same,
    # and negotiate the final currency
    if currency.nil? and c.nil?
      currency = Money.default_currency
    elsif currency.nil?
      currency = c
    elsif c.nil?
      currency = currency
    elsif currency != c
      # TODO: ParseError
      raise ArgumentError, "Mismatching Currencies"
    end
    currency = Money::Currency.wrap(currency)

    fractional = extract_cents(i, currency)
    Money.new(fractional, currency)
  end

  # Takes a number string and attempts to massage out the number.
  #
  # @param [String] input The string containing a potential number.
  #
  # @return [Integer]
  #
  def self.extract_cents(input, currency = Money.default_currency)
    # remove anything that's not a number, potential thousands_separator, or minus sign
    num = input.gsub(/[^\d.,'-]/, '')

    # set a boolean flag for if the number is negative or not
    negative = num =~ /^-|-$/ ? true : false

    # decimal mark character
    decimal_char = currency.decimal_mark

    # if negative, remove the minus sign from the number
    # if it's not negative, the hyphen makes the value invalid
    if negative
      num = num.sub(/^-|-$/, '')
    end

    raise ArgumentError, "Invalid currency amount (hyphen)" if num.include?('-')

    #if the number ends with punctuation, just throw it out.  If it means decimal,
    #it won't hurt anything.  If it means a literal period or comma, this will
    #save it from being mis-interpreted as a decimal.
    num.chop! if num.match(/[\.|,]$/)

    # gather all decimal_marks within the result number
    used_delimiters = num.scan(/[^\d]/)

    # determine the number of unique decimal_marks within the number
    #
    # e.g.
    # $1,234,567.89 would return 2 (, and .)
    # $125,00 would return 1
    # $199 would return 0
    # $1 234,567.89 would raise an error (decimal_marks are space, comma, and period)
    case used_delimiters.uniq.length
      # no decimal_mark or thousands_separator; major (dollars) is the number, and minor (cents) is 0
    when 0 then major, minor = num, 0

      # two decimal_marks, so we know the last item in this array is the
      # major/minor thousands_separator and the rest are decimal_marks
    when 2
      thousands_separator, decimal_mark = used_delimiters.uniq

      # remove all thousands_separator, split on the decimal_mark
      major, minor = num.gsub(thousands_separator, '').split(decimal_mark)
      min = 0 unless min
    when 1
      # we can't determine if the comma or period is supposed to be a decimal_mark or a thousands_separator
      # e.g.
      # 1,00 - comma is a thousands_separator
      # 1.000 - period is a thousands_separator
      # 1,000 - comma is a decimal_mark
      # 1,000,000 - comma is a decimal_mark
      # 10000,00 - comma is a thousands_separator
      # 1000,000 - comma is a thousands_separator

      # assign first decimal_mark for reusability
      decimal_mark = used_delimiters.first

      # When we have identified the decimal mark character
      if decimal_char == decimal_mark
        major, minor = num.split(decimal_char)

      else
        # decimal_mark is used as a decimal_mark when there are multiple instances, always
        if num.scan(decimal_mark).length > 1 # multiple matches; treat as decimal_mark
          major, minor = num.gsub(decimal_mark, ''), 0
        else
          # ex: 1,000 - 1.0000 - 10001.000
          # split number into possible major (dollars) and minor (cents) values
          possible_major, possible_minor = num.split(decimal_mark)
          possible_major ||= "0"
          possible_minor ||= "00"

          # if the minor (cents) length isn't 3, assign major/minor from the possibles
          # e.g.
          #   1,00 => 1.00
          #   1.0000 => 1.00
          #   1.2 => 1.20
          if possible_minor.length != 3 # thousands_separator
            major, minor = possible_major, possible_minor
          else
            # minor length is three
            # let's try to figure out intent of the thousands_separator

            # the major length is greater than three, which means
            # the comma or period is used as a thousands_separator
            # e.g.
            #   1000,000
            #   100000,000
            if possible_major.length > 3
              major, minor = possible_major, possible_minor
            else
              # number is in format ###{sep}### or ##{sep}### or #{sep}###
              # handle as , is sep, . is thousands_separator
              if decimal_mark == '.'
                major, minor = possible_major, possible_minor
              else
                major, minor = "#{possible_major}#{possible_minor}", 0
              end
            end
          end
        end
      end
    else
      # TODO: ParseError
      raise ArgumentError, "Invalid currency amount"
    end

    # build the string based on major/minor since decimal_mark/thousands_separator have been removed
    # avoiding floating point arithmetic here to ensure accuracy
    cents = (major.to_i * currency.subunit_to_unit)
    # Because of an bug in JRuby, we can't just call #floor
    minor = minor.to_s
    minor = if minor.size < currency.decimal_places
              (minor + ("0" * currency.decimal_places))[0,currency.decimal_places].to_i
            elsif minor.size > currency.decimal_places
              if minor[currency.decimal_places,1].to_i >= 5
                minor[0,currency.decimal_places].to_i+1
              else
                minor[0,currency.decimal_places].to_i
              end
            else
              minor.to_i
            end

    cents += minor

    # if negative, multiply by -1; otherwise, return positive cents
    negative ? cents * -1 : cents
  end

  ##
  # Formats a low and high amount in the given currency into a price string
  #
  # = Example
  #
  #   $10,000 - 20,000 for (10000, 20000, "USD")
  #   HKD $10,000 - 20,000 for (10000, 20000, "HKD")
  #   $10,000 ... 20,000 for (10000, 20000, "USD", " ... ")
  #   HKD $10,000 ... 20,000 for (10000, 20000, "HKD", " ... ")
  #
  # = Arguments
  #
  #   low: (Float)
  #   high: (Float)
  #   currency: (String)
  #   delimiter: (String) optional
  def self.money_range_to_text(low, high, currency, delimiter = ' - ')
    if low.blank? && high.blank?
      nil
    elsif low.blank?
      "Under " + money_to_text(high, currency)
    elsif high.blank?
      money_to_text(low, currency) + " and up"
    elsif low == high
      money_to_text(low, currency)
    else
      [ money_to_text(low, currency), money_to_text(high, currency, true) ].compact.join(delimiter)
    end
  end

  private

  def self.code_valid?(code)
    Money::Currency.stringified_keys.include?(code.downcase)
  end

  def self.symbol_for_code(code)
    return unless code && code_valid?(code)
    Money::Currency.new(code).symbol.tap do |symbol|
      symbol.strip! if symbol.present?
    end
  end

end
