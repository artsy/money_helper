# encoding: UTF-8

module MoneyHelper
  
  SYMBOL_ONLY = %w{USD GBP EUR RM TL} #don't use ISO code
  OK_SYMBOLS = %w{
    $ £ € ¥ 元 р. L ƒ ৳ P R$ K ₡ D ლ ₵ Q G L ₹ Rp ₪ ₩ ₭ R RM ₨ ₮ դր C$ ₦ TL K ₲ ₱ T ฿ T$ m ₴ ₫
  } #ok to include in string

  ##
  # Formats a single amount in the given currency into a price string
  #
  # = Example
  #
  #   $10,000; HKD $10,000 for (10000, "USD") and (10000, "HKD"), respectively
  #
  # = Arguments
  #
  #   amount: (Float)
  #   currency: (String)
  #   number_only: (Boolean) optional flag to exclude currency indicators
  def self.money_to_text(amount, currency, number_only = false)
    return nil unless amount.present?
    currency_obj = Money::Currency.new(currency)
    (number_only || SYMBOL_ONLY.include?(currency) ? '' : currency + ' ') + 
      Money.parse(amount.ceil, currency.presence).format({
        no_cents: true,
        symbol_position: :before,
        symbol: (!number_only && OK_SYMBOLS.include?(currency_obj.symbol))
      })
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
    if low.nil? && high.nil?
      nil
    elsif low.nil?
      "Under " + money_to_text(high, currency)
    elsif high.nil?
      money_to_text(low, currency) + " and up"
    elsif low == high
      money_to_text(low, currency)
    else
      [ money_to_text(low, currency), money_to_text(high, currency, true) ].compact.join(delimiter)
    end
  end
  
end
