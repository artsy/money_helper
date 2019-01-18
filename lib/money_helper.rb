require 'active_support/core_ext/object/blank'
require 'money'

module MoneyHelper
  Money.locale_backend = :currency
  I18n.enforce_available_locales = false

  SYMBOL_ONLY = %w[USD GBP EUR MYR].freeze # don't use ISO code
  OK_SYMBOLS = %w[
    $ £ € ¥ 元 р. L ƒ ৳ P R$ K ₡ D ლ ₵ Q G ₹ Rp ₪ ₩ ₭ R RM ₨ ₮ դր. C$ ₦ ₲ ₱ T ฿ T$ m ₴ ₫ ៛ ₺ E ₽
  ].freeze # ok to include in string

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
  def self.money_to_text(amount, currency, number_only = false, options = {})
    return nil unless amount.present?

    currency = 'USD' if currency.blank?
    valid_currency = code_valid?(currency) ? currency : 'USD'
    symbol = symbol_for_code(currency)
    include_symbol = !number_only && symbol.present? && OK_SYMBOLS.include?(symbol)
    subunit_factor = Money::Currency.new(valid_currency).subunit_to_unit
    money_options = { no_cents: true, format: '%u %n', symbol: include_symbol }.merge(options)
    (number_only || SYMBOL_ONLY.include?(currency) ? '' : currency + ' ') +
      Money.new(amount * subunit_factor.ceil, valid_currency).format(money_options).delete(' ')
  end

  def self.symbol_with_optional_iso_code(currency = 'USD')
    symbol = symbol_for_code(currency)
    if SYMBOL_ONLY.include?(currency)
      symbol
    elsif symbol && OK_SYMBOLS.include?(symbol)
      "#{iso_for_currency(currency)} #{symbol}"
    else
      iso_for_currency(currency).to_s
    end
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
      'Under ' + money_to_text(high, currency)
    elsif high.blank?
      money_to_text(low, currency) + ' and up'
    elsif low == high
      money_to_text(low, currency)
    else
      [money_to_text(low, currency), money_to_text(high, currency, true)].compact.join(delimiter)
    end
  end

  private

  def self.code_valid?(code)
    Money::Currency.stringified_keys.include?(code.downcase)
  end

  def self.iso_for_currency(code)
    return unless code && code_valid?(code)

    Money::Currency.new(code).iso_code.tap do |iso_code|
      iso_code.strip! if iso_code.present?
    end
  end

  def self.symbol_for_code(code)
    return unless code && code_valid?(code)

    Money::Currency.new(code).symbol.tap do |symbol|
      symbol.strip! if symbol.present?
    end
  end
end
