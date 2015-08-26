# encoding: UTF-8

require 'money_helper'

describe MoneyHelper do
  describe "money_to_text" do
    it "includes only symbol for well-recognizable currencies" do
      expect(MoneyHelper.money_to_text(30000, "EUR")).to eql("€30.000")
      expect(MoneyHelper.money_to_text(30000, "GBP")).to eql("£30,000")
      expect(MoneyHelper.money_to_text(30000, "MYR")).to eql("RM30,000")
      expect(MoneyHelper.money_to_text(30000, "TRY")).to eql("TRY ₺30.000")
      expect(MoneyHelper.money_to_text(30000, "USD")).to eql("$30,000")
    end
    it "includes ISO code and symbol for ambiguous currencies" do
      expect(MoneyHelper.money_to_text(30000, "AUD")).to eql("AUD $30,000")
      expect(MoneyHelper.money_to_text(30000, "ARS")).to eql("ARS $30.000")
      expect(MoneyHelper.money_to_text(30000, "BBD")).to eql("BBD $30,000")
      expect(MoneyHelper.money_to_text(30000, "BMD")).to eql("BMD $30,000")
      expect(MoneyHelper.money_to_text(30000, "BND")).to eql("BND $30,000")
      expect(MoneyHelper.money_to_text(30000, "BSD")).to eql("BSD $30,000")
      expect(MoneyHelper.money_to_text(30000, "BZD")).to eql("BZD $30,000")
      expect(MoneyHelper.money_to_text(30000, "CAD")).to eql("CAD $30,000")
      expect(MoneyHelper.money_to_text(30000, "CLP")).to eql("CLP $30.000")
      expect(MoneyHelper.money_to_text(30000, "COP")).to eql("COP $30.000")
      expect(MoneyHelper.money_to_text(30000, "CUC")).to eql("CUC $30,000")
      expect(MoneyHelper.money_to_text(30000, "CUP")).to eql("CUP $30,000")
      expect(MoneyHelper.money_to_text(30000, "DOP")).to eql("DOP $30,000")
      expect(MoneyHelper.money_to_text(30000, "FJD")).to eql("FJD $30,000")
      expect(MoneyHelper.money_to_text(30000, "GYD")).to eql("GYD $30,000")
      expect(MoneyHelper.money_to_text(30000, "HKD")).to eql("HKD $30,000")
      expect(MoneyHelper.money_to_text(30000, "JMD")).to eql("JMD $30,000")
      expect(MoneyHelper.money_to_text(30000, "KYD")).to eql("KYD $30,000")
      expect(MoneyHelper.money_to_text(30000, "LRD")).to eql("LRD $30,000")
      expect(MoneyHelper.money_to_text(30000, "MXN")).to eql("MXN $30,000")
      expect(MoneyHelper.money_to_text(30000, "NAD")).to eql("NAD $30,000")
      expect(MoneyHelper.money_to_text(30000, "NZD")).to eql("NZD $30,000")
      expect(MoneyHelper.money_to_text(30000, "SBD")).to eql("SBD $30,000")
      expect(MoneyHelper.money_to_text(30000, "SGD")).to eql("SGD $30,000")
      expect(MoneyHelper.money_to_text(30000, "SRD")).to eql("SRD $30,000")
      expect(MoneyHelper.money_to_text(30000, "TWD")).to eql("TWD $30,000")
      expect(MoneyHelper.money_to_text(30000, "TTD")).to eql("TTD $30,000")
      expect(MoneyHelper.money_to_text(30000, "UYU")).to eql("UYU $30.000")
      expect(MoneyHelper.money_to_text(30000, "XCD")).to eql("XCD $30,000")
      expect(MoneyHelper.money_to_text(30000, "ZWL")).to eql("ZWL $30,000")

      expect(MoneyHelper.money_to_text(30000, "FKP")).to eql("FKP £30,000")
      expect(MoneyHelper.money_to_text(30000, "GIP")).to eql("GIP £30,000")
      expect(MoneyHelper.money_to_text(30000, "SDG")).to eql("SDG £30,000")
      expect(MoneyHelper.money_to_text(30000, "SHP")).to eql("SHP £30,000")

      expect(MoneyHelper.money_to_text(30000, "CNY")).to eql("CNY ¥30,000")
      expect(MoneyHelper.money_to_text(30000, "JPY")).to eql("JPY ¥30,000")

      expect(MoneyHelper.money_to_text(30000, "ALL")).to eql("ALL L30,000")
      expect(MoneyHelper.money_to_text(30000, "HNL")).to eql("HNL L30,000")
      expect(MoneyHelper.money_to_text(30000, "LSL")).to eql("LSL L30,000")
      expect(MoneyHelper.money_to_text(30000, "MDL")).to eql("MDL L30,000")
      expect(MoneyHelper.money_to_text(30000, "RON")).to eql("RON 30.000")
      expect(MoneyHelper.money_to_text(30000, "SZL")).to eql("SZL E30,000")

      expect(MoneyHelper.money_to_text(30000, "ANG")).to eql("ANG ƒ30.000")
      expect(MoneyHelper.money_to_text(30000, "AWG")).to eql("AWG ƒ30,000")

      expect(MoneyHelper.money_to_text(30000, "BWP")).to eql("BWP P30,000")
      expect(MoneyHelper.money_to_text(30000, "MOP")).to eql("MOP P30,000")

      expect(MoneyHelper.money_to_text(30000, "CRC")).to eql("CRC ₡30.000")
      expect(MoneyHelper.money_to_text(30000, "SVC")).to eql("SVC ₡30,000")

      expect(MoneyHelper.money_to_text(30000, "MUR")).to eql("MUR ₨30,000")
      expect(MoneyHelper.money_to_text(30000, "NPR")).to eql("NPR ₨30,000")
      expect(MoneyHelper.money_to_text(30000, "PKR")).to eql("PKR ₨30,000")
      expect(MoneyHelper.money_to_text(30000, "SCR")).to eql("SCR ₨30,000")
    end
    it "includes ISO code and symbol for difficult to recognize symbols" do
      expect(MoneyHelper.money_to_text(30000, "AMD")).to eql("AMD դր.30,000")
      expect(MoneyHelper.money_to_text(30000, "BDT")).to eql("BDT ৳30,000")
      expect(MoneyHelper.money_to_text(30000, "BRL")).to eql("BRL R$30.000")
      expect(MoneyHelper.money_to_text(30000, "GMD")).to eql("GMD D30,000")
      expect(MoneyHelper.money_to_text(30000, "GEL")).to eql("GEL ლ30,000")
      expect(MoneyHelper.money_to_text(30000, "GHS")).to eql("GHS ₵30,000")
      expect(MoneyHelper.money_to_text(30000, "GTQ")).to eql("GTQ Q30,000")
      expect(MoneyHelper.money_to_text(30000, "HTG")).to eql("HTG G30,000")
      expect(MoneyHelper.money_to_text(30000, "IDR")).to eql("IDR Rp30.000")
      expect(MoneyHelper.money_to_text(30000, "ILS")).to eql("ILS ₪30,000")
      expect(MoneyHelper.money_to_text(30000, "INR")).to eql("INR ₹30,000")
      expect(MoneyHelper.money_to_text(30000, "KHR")).to eql("KHR ៛30,000")
      expect(MoneyHelper.money_to_text(30000, "KPW")).to eql("KPW ₩30,000")
      expect(MoneyHelper.money_to_text(30000, "LAK")).to eql("LAK ₭30,000")
      expect(MoneyHelper.money_to_text(30000, "MNT")).to eql("MNT ₮30,000")
      expect(MoneyHelper.money_to_text(30000, "NIO")).to eql("NIO C$30,000")
      expect(MoneyHelper.money_to_text(30000, "NGN")).to eql("NGN ₦30,000")
      expect(MoneyHelper.money_to_text(30000, "PGK")).to eql("PGK K30,000")
      expect(MoneyHelper.money_to_text(30000, "PHP")).to eql("PHP ₱30,000")
      expect(MoneyHelper.money_to_text(30000, "PYG")).to eql("PYG ₲30,000")
      expect(MoneyHelper.money_to_text(30000, "RUB")).to eql("RUB ₽30.000")
      expect(MoneyHelper.money_to_text(30000, "THB")).to eql("THB ฿30,000")
      expect(MoneyHelper.money_to_text(30000, "TOP")).to eql("TOP T$30,000")
      expect(MoneyHelper.money_to_text(30000, "TMT")).to eql("TMT T30,000")
      expect(MoneyHelper.money_to_text(30000, "UAH")).to eql("UAH ₴30,000")
      expect(MoneyHelper.money_to_text(30000, "VND")).to eql("VND ₫30.000")
      expect(MoneyHelper.money_to_text(30000, "WST")).to eql("WST T30,000")
      expect(MoneyHelper.money_to_text(30000, "ZAR")).to eql("ZAR R30,000")
    end
    it "includes only ISO code for currencies that don't have a symbol" do
      expect(MoneyHelper.money_to_text(30000, "UZS")).to eql("UZS 30,000")
    end
    it "includes only ISO code for RTL symbols" do
      expect(MoneyHelper.money_to_text(30000, "AFN")).to eql("AFN 30,000")
      expect(MoneyHelper.money_to_text(30000, "DZD")).to eql("DZD 30,000")
      expect(MoneyHelper.money_to_text(30000, "BHD")).to eql("BHD 30,000")
      expect(MoneyHelper.money_to_text(30000, "EGP")).to eql("EGP 30,000")
      expect(MoneyHelper.money_to_text(30000, "IRR")).to eql("IRR 30,000")
      expect(MoneyHelper.money_to_text(30000, "IQD")).to eql("IQD 30,000")
      expect(MoneyHelper.money_to_text(30000, "JOD")).to eql("JOD 30,000")
      expect(MoneyHelper.money_to_text(30000, "KWD")).to eql("KWD 30,000")
      expect(MoneyHelper.money_to_text(30000, "LBP")).to eql("LBP 30,000")
      expect(MoneyHelper.money_to_text(30000, "LYD")).to eql("LYD 30,000")
      expect(MoneyHelper.money_to_text(30000, "MAD")).to eql("MAD 30,000")
      expect(MoneyHelper.money_to_text(30000, "OMR")).to eql("OMR 30,000")
      expect(MoneyHelper.money_to_text(30000, "JOD")).to eql("JOD 30,000")
      expect(MoneyHelper.money_to_text(30000, "QAR")).to eql("QAR 30,000")
      expect(MoneyHelper.money_to_text(30000, "SAR")).to eql("SAR 30,000")
      expect(MoneyHelper.money_to_text(30000, "SYP")).to eql("SYP 30,000")
      expect(MoneyHelper.money_to_text(30000, "TND")).to eql("TND 30,000")
      expect(MoneyHelper.money_to_text(30000, "AED")).to eql("AED 30,000")
      expect(MoneyHelper.money_to_text(30000, "YER")).to eql("YER 30,000")
    end
    it "defaults to USD when an empty string or nil is passed as the currency" do
      expect(MoneyHelper.money_to_text(30000, "")).to eql("$30,000")
      expect(MoneyHelper.money_to_text(30000, nil)).to eql("$30,000")
    end
    it "returns only the formatted numeral when number_only = true" do
      expect(MoneyHelper.money_to_text(30000, "EUR", true)).to eql("30.000")
      expect(MoneyHelper.money_to_text(30000, "AUD", true)).to eql("30,000")
      expect(MoneyHelper.money_to_text(30000, "AMD", true)).to eql("30,000")
      expect(MoneyHelper.money_to_text(30000, "AFN", true)).to eql("30,000")
    end
    it "returns nil if amount passed in is whitespace, empty string, or nil" do
      expect(MoneyHelper.money_to_text(" ", "USD")).to be_nil
      expect(MoneyHelper.money_to_text("", "USD")).to be_nil
      expect(MoneyHelper.money_to_text(nil, "USD")).to be_nil
    end
    it "falls back to ISO code when currency can't be found" do
      expect(MoneyHelper.money_to_text(10_000, "ITL")).to eql("ITL 10,000")
      expect(MoneyHelper.money_to_text(10_000, "ITL", true)).to eql("10,000")
    end
    it 'allows options to be passed through and cents displayed' do
      expect(MoneyHelper.money_to_text(10_000.1, 'USD', nil, no_cents: false)).to eq '$10,000.10'
      expect(MoneyHelper.money_to_text(10_000.1, 'USD')).to eq '$10,000'
    end
  end
  describe "money_range_to_text" do
    it "includes no indicator for currency for the upper amount in range" do
      expect(MoneyHelper.money_range_to_text(30000, 40000, "USD")).to eql("$30,000 - 40,000")
      expect(MoneyHelper.money_range_to_text(30000, 40000, "AUD")).to eql("AUD $30,000 - 40,000")
      expect(MoneyHelper.money_range_to_text(30000, 40000, "AMD")).to eql("AMD դր.30,000 - 40,000")
      expect(MoneyHelper.money_range_to_text(30000, 40000, "AFN")).to eql("AFN 30,000 - 40,000")
    end
    it "uses the special range amount delimeter when supplied" do
      expect(MoneyHelper.money_range_to_text(30000, 40000, "USD", "-")).to eql("$30,000-40,000")
      expect(MoneyHelper.money_range_to_text(30000, 40000, "AUD", "-")).to eql("AUD $30,000-40,000")
      expect(MoneyHelper.money_range_to_text(30000, 40000, "AMD", "-")).to eql("AMD դր.30,000-40,000")
      expect(MoneyHelper.money_range_to_text(30000, 40000, "AFN", "-")).to eql("AFN 30,000-40,000")
    end
    it "prefixes the text 'Under ' when low amount not given" do
      expect(MoneyHelper.money_range_to_text(nil, 40000, "USD")).to eql("Under $40,000")
    end
    it "appends the text ' and up' when high amount not given" do
      expect(MoneyHelper.money_range_to_text(30000, nil, "USD")).to eql("$30,000 and up")
    end
    it "treats as a single price when low amount and high amount are identical" do
      expect(MoneyHelper.money_range_to_text(30000, 30000, "USD")).to eql("$30,000")
    end
    it "returns nil when both amounts are nil" do
      expect(MoneyHelper.money_range_to_text(nil, nil, "USD")).to be_nil
    end
    it "falls back to ISO code when currency can't be found" do
      expect(MoneyHelper.money_range_to_text(10_000, 20_000, "ITL")).to eql("ITL 10,000 - 20,000")
    end
  end
end
