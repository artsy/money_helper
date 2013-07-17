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
    symbol = Money::Currency.new(currency).symbol.strip
    include_symbol = !number_only && OK_SYMBOLS.include?(symbol)
    (number_only || SYMBOL_ONLY.include?(currency) ? "" : currency + " ") + 
      Money.parse(amount.ceil, currency).format({
        no_cents: true,
        symbol_position: :before,
        symbol: include_symbol
      }).delete(' ')
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
  
end
