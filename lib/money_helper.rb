# frozen_string_literal: true

require_relative 'version'

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
  #   MoneyHelper.money_to_text(30_175_93, currency: 'USD')  #=> 'USD $30,175.93'
  #   MoneyHelper.money_to_text(30_175_93, currency: 'EUR')  #=> 'EUR €30.175,93'
  #   MoneyHelper.money_to_text(30_175_93)                   #=> 'USD $30,175.93'
  #
  # = Arguments
  #
  #   amount_minor: (Integer) amount in minor unit
  #   currency: (String) optional ISO currency code, defaulting to USD
  #   with_currency: (Boolean) optional flag to include ISO currency code, defaulting to true
  # 　format: (Hash) optional formatting options to pass to `Money#format` e.g.:
  #     no_cents: (Boolean) optional flag to exclude cents, defaulting to false
  #     symbol: (Boolean) optional flag to include currency symbol, defaulting to true
  def self.money_to_text(amount_minor, currency: 'USD', with_currency: true, format: {})
    return '' if amount_minor.blank?

    format_options = { format: '%u%n' }.merge(format)

    formatted_amount = Money.new(amount_minor, currency).format(format_options)
    formatted_currency = with_currency ? currency.upcase : ''

    "#{formatted_currency} #{formatted_amount}".strip
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
  #   MoneyHelper.money_range_to_text(30_175_93, 40_983_27, currency: 'USD')     #=> 'USD $30,175.93 - 40,983.27'
  #   MoneyHelper.money_range_to_text(30_175_93, 40_983_27)                      #=> 'USD $30,175.93 - 40,983.27'
  #   MoneyHelper.money_range_to_text(30_175_93, 40_983_27, currency: 'EUR')     #=> 'EUR €30.175,93 - 40.983,27'
  #   MoneyHelper.money_range_to_text(30_175_93, 40_983_27, delimiter: ' ... ')  #=> 'USD $30,175.93 ... 40,983.27'
  #
  # = Arguments
  #
  #   low: (Integer) amount in minor unit
  #   high: (Integer) amount in minor unit
  #   currency: (String) optional ISO currency code, defaulting to USD
  #   delimiter: (String) optional
  def self.money_range_to_text(low, high, currency: 'USD', delimiter: ' - ')
    if low.blank? && high.blank?
      ''
    elsif low.blank?
      "Under #{money_to_text(high, currency: currency)}"
    elsif high.blank?
      "#{money_to_text(low, currency: currency)} and up"
    elsif low == high
      money_to_text(low, currency: currency)
    else
      formatted_low = money_to_text(low, currency: currency)
      formatted_high = money_to_text(high, currency: currency, with_currency: false, format: { symbol: false })
      [formatted_low, formatted_high].compact.join(delimiter)
    end
  end

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
