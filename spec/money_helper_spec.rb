require 'spec_helper'

describe MoneyHelper do
  describe 'money_to_text' do
    it 'includes ISO code and symbol' do
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'AUD')).to eql('AUD $30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'ARS')).to eql('ARS $30.175,93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'BBD')).to eql('BBD $30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'BMD')).to eql('BMD $30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'BND')).to eql('BND $30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'BSD')).to eql('BSD $30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'BZD')).to eql('BZD $30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'CAD')).to eql('CAD $30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'CLP')).to eql('CLP $3.017.593')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'COP')).to eql('COP $30.175,93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'CUC')).to eql('CUC $30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'CUP')).to eql('CUP $30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'DOP')).to eql('DOP $30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'FJD')).to eql('FJD $30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'GYD')).to eql('GYD $30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'HKD')).to eql('HKD $30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'JMD')).to eql('JMD $30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'KYD')).to eql('KYD $30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'LRD')).to eql('LRD $30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'MXN')).to eql('MXN $30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'NAD')).to eql('NAD $30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'NZD')).to eql('NZD $30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'SBD')).to eql('SBD $30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'SGD')).to eql('SGD $30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'SRD')).to eql('SRD $30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'TWD')).to eql('TWD $30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'TTD')).to eql('TTD $30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'UYU')).to eql('UYU $U30.175,93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'USD')).to eql('USD $30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'XCD')).to eql('XCD $30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'ZWL')).to eql('ZWL $30,175.93')

      expect(MoneyHelper.money_to_text(30_175_93, currency: 'EUR')).to eql('EUR €30.175,93')

      expect(MoneyHelper.money_to_text(30_175_93, currency: 'FKP')).to eql('FKP £30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'GBP')).to eql('GBP £30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'GIP')).to eql('GIP £30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'SDG')).to eql('SDG £30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'SHP')).to eql('SHP £30,175.93')

      expect(MoneyHelper.money_to_text(30_175_93, currency: 'CNY')).to eql('CNY ¥30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'JPY')).to eql('JPY ¥3,017,593')

      expect(MoneyHelper.money_to_text(30_175_93, currency: 'ALL')).to eql('ALL L30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'HNL')).to eql('HNL L30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'LSL')).to eql('LSL L30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'MDL')).to eql('MDL L30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'MYR')).to eql('MYR RM30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'RON')).to eql('RON Lei30.175,93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'SZL')).to eql('SZL E30,175.93')

      expect(MoneyHelper.money_to_text(30_175_93, currency: 'ANG')).to eql('ANG ƒ30.175,93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'AWG')).to eql('AWG ƒ30,175.93')

      expect(MoneyHelper.money_to_text(30_175_93, currency: 'BWP')).to eql('BWP P30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'MOP')).to eql('MOP P30,175.93')

      expect(MoneyHelper.money_to_text(30_175_93, currency: 'CRC')).to eql('CRC ₡30.175,93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'SVC')).to eql('SVC ₡30,175.93')

      expect(MoneyHelper.money_to_text(30_175_93, currency: 'MUR')).to eql('MUR ₨30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'NPR')).to eql('NPR Rs.30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'PKR')).to eql('PKR ₨30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'SCR')).to eql('SCR ₨30,175.93')

      expect(MoneyHelper.money_to_text(30_175_93, currency: 'AMD')).to eql('AMD դր.30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'BDT')).to eql('BDT ৳30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'BRL')).to eql('BRL R$30.175,93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'GEL')).to eql('GEL ლ30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'GHS')).to eql('GHS ₵30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'GMD')).to eql('GMD D30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'GTQ')).to eql('GTQ Q30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'HTG')).to eql('HTG G30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'IDR')).to eql('IDR Rp30.175,93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'ILS')).to eql('ILS ₪30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'INR')).to eql('INR ₹30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'KHR')).to eql('KHR ៛30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'KPW')).to eql('KPW ₩30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'LAK')).to eql('LAK ₭30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'MNT')).to eql('MNT ₮30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'NGN')).to eql('NGN ₦30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'NIO')).to eql('NIO C$30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'PGK')).to eql('PGK K30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'PHP')).to eql('PHP ₱30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'PYG')).to eql('PYG ₲3,017,593')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'RUB')).to eql('RUB ₽30.175,93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'THB')).to eql('THB ฿30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'TMT')).to eql('TMT T30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'TOP')).to eql('TOP T$30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'TRY')).to eql('TRY ₺30.175,93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'UAH')).to eql('UAH ₴30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'VND')).to eql('VND ₫3.017.593')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'WST')).to eql('WST T30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'ZAR')).to eql('ZAR R30,175.93')
    end

    it "respects currency's thousands separator and decimal mark" do
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'USD')).to eql('USD $30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'EUR')).to eql('EUR €30.175,93')
    end

    it "converts from currency's minor unit to major unit" do
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'USD')).to eql('USD $30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'JPY')).to eql('JPY ¥3,017,593')
    end

    it 'displays LTR for RTL symbols' do
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'AFN')).to eql('AFN ؋30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'DZD')).to eql('DZD د.ج30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'BHD')).to eql('BHD د.ب3,017.593')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'EGP')).to eql('EGP ج.م30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'IRR')).to eql('IRR ﷼30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'IQD')).to eql('IQD ع.د3,017.593')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'JOD')).to eql('JOD د.ا3,017.593')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'LYD')).to eql('LYD ل.د3,017.593')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'MAD')).to eql('MAD د.م.30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'QAR')).to eql('QAR ر.ق30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'SYP')).to eql('SYP £S30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'TND')).to eql('TND د.ت3,017.593')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'AED')).to eql('AED د.إ30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'YER')).to eql('YER ﷼30,175.93')
    end

    it 'defaults to USD' do
      expect(MoneyHelper.money_to_text(30_175_93)).to eql('USD $30,175.93')
    end

    it 'omits ISO code when with_currency is false' do
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'EUR', with_currency: false)).to eql('€30.175,93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'AUD', with_currency: false)).to eql('$30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'AMD', with_currency: false)).to eql('դր.30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'AFN', with_currency: false)).to eql('؋30,175.93')
    end

    it 'omits symbol when with_symbol is false' do
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'EUR', with_symbol: false)).to eql('EUR 30.175,93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'AUD', with_symbol: false)).to eql('AUD 30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'AMD', with_symbol: false)).to eql('AMD 30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'AFN', with_symbol: false)).to eql('AFN 30,175.93')
    end

    it 'omits ISO code and symbol when both with_currency and with_symbol are false' do
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'EUR', with_currency: false, with_symbol: false)).to eql('30.175,93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'AUD', with_currency: false, with_symbol: false)).to eql('30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'AMD', with_currency: false, with_symbol: false)).to eql('30,175.93')
      expect(MoneyHelper.money_to_text(30_175_93, currency: 'AFN', with_currency: false, with_symbol: false)).to eql('30,175.93')
    end

    it 'returns an empty string if amount passed in is whitespace, empty string, or nil' do
      expect(MoneyHelper.money_to_text(' ')).to eql('')
      expect(MoneyHelper.money_to_text('')).to eql('')
      expect(MoneyHelper.money_to_text(nil)).to eql('')
    end

    it "raises an exception when currency can't be found" do
      expect do
        MoneyHelper.money_to_text(30_175_93, currency: 'AAA')
      end.to raise_error(Money::Currency::UnknownCurrency, "Unknown currency 'aaa'")
    end
  end

  describe 'symbol_with_optional_iso_code' do
    it 'just includes the symbol for USD GBP EUR and MYR' do
      expect(MoneyHelper.symbol_with_optional_iso_code('EUR')).to eql('€')
      expect(MoneyHelper.symbol_with_optional_iso_code('GBP')).to eql('£')
      expect(MoneyHelper.symbol_with_optional_iso_code('MYR')).to eql('RM')
      expect(MoneyHelper.symbol_with_optional_iso_code('USD')).to eql('$')
    end

    it 'includes the iso code as well for other currencies' do
      expect(MoneyHelper.symbol_with_optional_iso_code('AUD')).to eql('AUD $')
      expect(MoneyHelper.symbol_with_optional_iso_code('UZS')).to eql('UZS')
      expect(MoneyHelper.symbol_with_optional_iso_code('JPY')).to eql('JPY ¥')
    end
  end

  describe 'money_range_to_text' do
    it 'includes no indicator for currency for the upper amount in range' do
      expect(MoneyHelper.money_range_to_text(30_175_93, 40_983_27, currency: 'USD')).to eql('USD $30,175.93 - 40,983.27')
      expect(MoneyHelper.money_range_to_text(30_175_93, 40_983_27, currency: 'AUD')).to eql('AUD $30,175.93 - 40,983.27')
      expect(MoneyHelper.money_range_to_text(30_175_93, 40_983_27, currency: 'AMD')).to eql('AMD դր.30,175.93 - 40,983.27')
      expect(MoneyHelper.money_range_to_text(30_175_93, 40_983_27, currency: 'AFN')).to eql('AFN ؋30,175.93 - 40,983.27')
    end

    it 'uses the special range amount delimeter when supplied' do
      expect(MoneyHelper.money_range_to_text(30_175_93, 40_983_27, currency: 'USD', delimiter: '-')).to eql('USD $30,175.93-40,983.27')
      expect(MoneyHelper.money_range_to_text(30_175_93, 40_983_27, currency: 'AUD', delimiter: '-')).to eql('AUD $30,175.93-40,983.27')
      expect(MoneyHelper.money_range_to_text(30_175_93, 40_983_27, currency: 'AMD', delimiter: '-')).to eql('AMD դր.30,175.93-40,983.27')
      expect(MoneyHelper.money_range_to_text(30_175_93, 40_983_27, currency: 'AFN', delimiter: '-')).to eql('AFN ؋30,175.93-40,983.27')
    end

    it "prefixes the text 'Under ' when low amount not given" do
      expect(MoneyHelper.money_range_to_text(nil, 40_983_27, currency: 'USD')).to eql('Under USD $40,983.27')
    end

    it "appends the text ' and up' when high amount not given" do
      expect(MoneyHelper.money_range_to_text(30_175_93, nil, currency: 'USD')).to eql('USD $30,175.93 and up')
    end

    it 'treats as a single price when low amount and high amount are identical' do
      expect(MoneyHelper.money_range_to_text(30_175_93, 30_175_93, currency: 'USD')).to eql('USD $30,175.93')
    end

    it 'returns empty string when both amounts are nil' do
      expect(MoneyHelper.money_range_to_text(nil, nil, currency: 'USD')).to eql('')
    end

    it "raises an exception when currency can't be found" do
      expect do
        MoneyHelper.money_range_to_text(10_000, 20_000, currency: 'ITL')
      end.to raise_error(Money::Currency::UnknownCurrency, "Unknown currency 'itl'")
    end
  end

  describe 'symbol_with_optional_iso_code' do
    it 'returns the symbol only if currency is in SYMBOL_ONLY list' do
      expect(MoneyHelper.symbol_with_optional_iso_code('EUR')).to eql('€')
      expect(MoneyHelper.symbol_with_optional_iso_code('USD')).to eql('$')
    end

    it 'returns iso code and symbol if symbol is in OK_SYMBOLS' do
      expect(MoneyHelper.symbol_with_optional_iso_code('INR')).to eql('INR ₹')
      expect(MoneyHelper.symbol_with_optional_iso_code('KHR')).to eql('KHR ៛')
      expect(MoneyHelper.symbol_with_optional_iso_code('KPW')).to eql('KPW ₩')
    end

    it 'returns only the iso code if symbol is not in OK_SYMBOLS' do
      expect(MoneyHelper.symbol_with_optional_iso_code('CHF')).to eql('CHF')
      expect(MoneyHelper.symbol_with_optional_iso_code('YER')).to eql('YER')
    end
  end
end
