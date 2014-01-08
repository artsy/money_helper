# encoding: UTF-8

require 'money_helper'

describe MoneyHelper do
  describe "money_to_text" do
    it "includes only symbol for well-recognizable currencies" do
      MoneyHelper.money_to_text(30000, "EUR").should eql("€30.000")
      MoneyHelper.money_to_text(30000, "GBP").should eql("£30,000")
      MoneyHelper.money_to_text(30000, "MYR").should eql("RM30,000")
      MoneyHelper.money_to_text(30000, "TRY").should eql("TL30.000")
      MoneyHelper.money_to_text(30000, "USD").should eql("$30,000")
    end
    it "includes ISO code and symbol for ambiguous currencies" do
      MoneyHelper.money_to_text(30000, "AUD").should eql("AUD $30,000")
      MoneyHelper.money_to_text(30000, "ARS").should eql("ARS $30.000")
      MoneyHelper.money_to_text(30000, "BBD").should eql("BBD $30,000")
      MoneyHelper.money_to_text(30000, "BMD").should eql("BMD $30,000")
      MoneyHelper.money_to_text(30000, "BND").should eql("BND $30,000")
      MoneyHelper.money_to_text(30000, "BSD").should eql("BSD $30,000")
      MoneyHelper.money_to_text(30000, "BZD").should eql("BZD $30,000")
      MoneyHelper.money_to_text(30000, "CAD").should eql("CAD $30,000")
      MoneyHelper.money_to_text(30000, "CLP").should eql("CLP $30.000")
      MoneyHelper.money_to_text(30000, "COP").should eql("COP $30.000")
      MoneyHelper.money_to_text(30000, "CUC").should eql("CUC $30,000")
      MoneyHelper.money_to_text(30000, "CUP").should eql("CUP $30,000")
      MoneyHelper.money_to_text(30000, "DOP").should eql("DOP $30,000")
      MoneyHelper.money_to_text(30000, "FJD").should eql("FJD $30,000")
      MoneyHelper.money_to_text(30000, "GYD").should eql("GYD $30,000")
      MoneyHelper.money_to_text(30000, "HKD").should eql("HKD $30,000")
      MoneyHelper.money_to_text(30000, "JMD").should eql("JMD $30,000")
      MoneyHelper.money_to_text(30000, "KYD").should eql("KYD $30,000")
      MoneyHelper.money_to_text(30000, "LRD").should eql("LRD $30,000")
      MoneyHelper.money_to_text(30000, "MXN").should eql("MXN $30,000")
      MoneyHelper.money_to_text(30000, "NAD").should eql("NAD $30,000")
      MoneyHelper.money_to_text(30000, "NZD").should eql("NZD $30,000")
      MoneyHelper.money_to_text(30000, "SBD").should eql("SBD $30,000")
      MoneyHelper.money_to_text(30000, "SGD").should eql("SGD $30,000")
      MoneyHelper.money_to_text(30000, "SRD").should eql("SRD $30,000")
      MoneyHelper.money_to_text(30000, "TWD").should eql("TWD $30,000")
      MoneyHelper.money_to_text(30000, "TTD").should eql("TTD $30,000")
      MoneyHelper.money_to_text(30000, "UYU").should eql("UYU $30.000")
      MoneyHelper.money_to_text(30000, "XCD").should eql("XCD $30,000")
      MoneyHelper.money_to_text(30000, "ZWL").should eql("ZWL $30,000")

      MoneyHelper.money_to_text(30000, "FKP").should eql("FKP £30,000")
      MoneyHelper.money_to_text(30000, "GIP").should eql("GIP £30,000")
      MoneyHelper.money_to_text(30000, "SDG").should eql("SDG £30,000")
      MoneyHelper.money_to_text(30000, "SHP").should eql("SHP £30,000")

      MoneyHelper.money_to_text(30000, "CNY").should eql("CNY ¥30,000")
      MoneyHelper.money_to_text(30000, "JPY").should eql("JPY ¥30,000")

      MoneyHelper.money_to_text(30000, "ALL").should eql("ALL L30,000")
      MoneyHelper.money_to_text(30000, "HNL").should eql("HNL L30,000")
      MoneyHelper.money_to_text(30000, "LSL").should eql("LSL L30,000")
      MoneyHelper.money_to_text(30000, "MDL").should eql("MDL L30,000")
      MoneyHelper.money_to_text(30000, "RON").should eql("RON 30.000")
      MoneyHelper.money_to_text(30000, "SZL").should eql("SZL L30,000")

      MoneyHelper.money_to_text(30000, "ANG").should eql("ANG ƒ30.000")
      MoneyHelper.money_to_text(30000, "AWG").should eql("AWG ƒ30,000")

      MoneyHelper.money_to_text(30000, "BWP").should eql("BWP P30,000")
      MoneyHelper.money_to_text(30000, "MOP").should eql("MOP P30,000")

      MoneyHelper.money_to_text(30000, "CRC").should eql("CRC ₡30.000")
      MoneyHelper.money_to_text(30000, "SVC").should eql("SVC ₡30,000")

      MoneyHelper.money_to_text(30000, "MUR").should eql("MUR ₨30,000")
      MoneyHelper.money_to_text(30000, "NPR").should eql("NPR ₨30,000")
      MoneyHelper.money_to_text(30000, "PKR").should eql("PKR ₨30,000")
      MoneyHelper.money_to_text(30000, "SCR").should eql("SCR ₨30,000")
    end
    it "includes ISO code and symbol for difficult to recognize symbols" do
      MoneyHelper.money_to_text(30000, "AMD").should eql("AMD դր.30,000")
      MoneyHelper.money_to_text(30000, "BDT").should eql("BDT ৳30,000")
      MoneyHelper.money_to_text(30000, "BRL").should eql("BRL R$30.000")
      MoneyHelper.money_to_text(30000, "GMD").should eql("GMD D30,000")
      MoneyHelper.money_to_text(30000, "GEL").should eql("GEL ლ30,000")
      MoneyHelper.money_to_text(30000, "GHS").should eql("GHS ₵30,000")
      MoneyHelper.money_to_text(30000, "GTQ").should eql("GTQ Q30,000")
      MoneyHelper.money_to_text(30000, "HTG").should eql("HTG G30,000")
      MoneyHelper.money_to_text(30000, "IDR").should eql("IDR Rp30.000")
      MoneyHelper.money_to_text(30000, "ILS").should eql("ILS ₪30,000")
      MoneyHelper.money_to_text(30000, "INR").should eql("INR ₹30,000")
      MoneyHelper.money_to_text(30000, "KHR").should eql("KHR ៛30,000")
      MoneyHelper.money_to_text(30000, "KPW").should eql("KPW ₩30,000")
      MoneyHelper.money_to_text(30000, "LAK").should eql("LAK ₭30,000")
      MoneyHelper.money_to_text(30000, "MNT").should eql("MNT ₮30,000")
      MoneyHelper.money_to_text(30000, "NIO").should eql("NIO C$30,000")
      MoneyHelper.money_to_text(30000, "NGN").should eql("NGN ₦30,000")
      MoneyHelper.money_to_text(30000, "PGK").should eql("PGK K30,000")
      MoneyHelper.money_to_text(30000, "PHP").should eql("PHP ₱30,000")
      MoneyHelper.money_to_text(30000, "PYG").should eql("PYG ₲30,000")
      MoneyHelper.money_to_text(30000, "RUB").should eql("RUB р.30.000")
      MoneyHelper.money_to_text(30000, "THB").should eql("THB ฿30,000")
      MoneyHelper.money_to_text(30000, "TOP").should eql("TOP T$30,000")
      MoneyHelper.money_to_text(30000, "TMT").should eql("TMT m30,000")
      MoneyHelper.money_to_text(30000, "UAH").should eql("UAH ₴30,000")
      MoneyHelper.money_to_text(30000, "VND").should eql("VND ₫30.000")
      MoneyHelper.money_to_text(30000, "WST").should eql("WST T30,000")
      MoneyHelper.money_to_text(30000, "ZAR").should eql("ZAR R30,000")
    end
    it "includes only ISO code for currencies that don't have a symbol" do
      MoneyHelper.money_to_text(30000, "UZS").should eql("UZS 30,000")
    end
    it "includes only ISO code for RTL symbols" do
      MoneyHelper.money_to_text(30000, "AFN").should eql("AFN 30,000")
      MoneyHelper.money_to_text(30000, "DZD").should eql("DZD 30,000")
      MoneyHelper.money_to_text(30000, "BHD").should eql("BHD 30,000")
      MoneyHelper.money_to_text(30000, "EGP").should eql("EGP 30,000")
      MoneyHelper.money_to_text(30000, "IRR").should eql("IRR 30,000")
      MoneyHelper.money_to_text(30000, "IQD").should eql("IQD 30,000")
      MoneyHelper.money_to_text(30000, "JOD").should eql("JOD 30,000")
      MoneyHelper.money_to_text(30000, "KWD").should eql("KWD 30,000")
      MoneyHelper.money_to_text(30000, "LBP").should eql("LBP 30,000")
      MoneyHelper.money_to_text(30000, "LYD").should eql("LYD 30,000")
      MoneyHelper.money_to_text(30000, "MAD").should eql("MAD 30,000")
      MoneyHelper.money_to_text(30000, "OMR").should eql("OMR 30,000")
      MoneyHelper.money_to_text(30000, "JOD").should eql("JOD 30,000")
      MoneyHelper.money_to_text(30000, "QAR").should eql("QAR 30,000")
      MoneyHelper.money_to_text(30000, "SAR").should eql("SAR 30,000")
      MoneyHelper.money_to_text(30000, "SYP").should eql("SYP 30,000")
      MoneyHelper.money_to_text(30000, "TND").should eql("TND 30,000")
      MoneyHelper.money_to_text(30000, "AED").should eql("AED 30,000")
      MoneyHelper.money_to_text(30000, "YER").should eql("YER 30,000")
    end
    it "defaults to USD when an empty string or nil is passed as the currency" do
      MoneyHelper.money_to_text(30000, "").should eql("$30,000")
      MoneyHelper.money_to_text(30000, nil).should eql("$30,000")
    end
    it "returns only the formatted numeral when number_only = true" do
      MoneyHelper.money_to_text(30000, "EUR", true).should eql("30.000")
      MoneyHelper.money_to_text(30000, "AUD", true).should eql("30,000")
      MoneyHelper.money_to_text(30000, "AMD", true).should eql("30,000")
      MoneyHelper.money_to_text(30000, "AFN", true).should eql("30,000")
    end
    it "returns nil if amount passed in is whitespace, empty string, or nil" do
      MoneyHelper.money_to_text(" ", "USD").should be_nil
      MoneyHelper.money_to_text("", "USD").should be_nil
      MoneyHelper.money_to_text(nil, "USD").should be_nil
    end
    it "falls back to ISO code when currency can't be found" do
      MoneyHelper.money_to_text(10_000, "ITL").should eql("ITL 10,000")
      MoneyHelper.money_to_text(10_000, "ITL", true).should eql("10,000")
    end
  end
  describe "money_range_to_text" do
    it "includes no indicator for currency for the upper amount in range" do
      MoneyHelper.money_range_to_text(30000, 40000, "USD").should eql("$30,000 - 40,000")
      MoneyHelper.money_range_to_text(30000, 40000, "AUD").should eql("AUD $30,000 - 40,000")
      MoneyHelper.money_range_to_text(30000, 40000, "AMD").should eql("AMD դր.30,000 - 40,000")
      MoneyHelper.money_range_to_text(30000, 40000, "AFN").should eql("AFN 30,000 - 40,000")
    end
    it "uses the special range amount delimeter when supplied" do
      MoneyHelper.money_range_to_text(30000, 40000, "USD", "-").should eql("$30,000-40,000")
      MoneyHelper.money_range_to_text(30000, 40000, "AUD", "-").should eql("AUD $30,000-40,000")
      MoneyHelper.money_range_to_text(30000, 40000, "AMD", "-").should eql("AMD դր.30,000-40,000")
      MoneyHelper.money_range_to_text(30000, 40000, "AFN", "-").should eql("AFN 30,000-40,000")
    end
    it "prefixes the text 'Under ' when low amount not given" do
      MoneyHelper.money_range_to_text(nil, 40000, "USD").should eql("Under $40,000")
    end
    it "appends the text ' and up' when high amount not given" do
      MoneyHelper.money_range_to_text(30000, nil, "USD").should eql("$30,000 and up")
    end
    it "treats as a single price when low amount and high amount are identical" do
      MoneyHelper.money_range_to_text(30000, 30000, "USD").should eql("$30,000")
    end
    it "returns nil when both amounts are nil" do
      MoneyHelper.money_range_to_text(nil, nil, "USD").should be_nil
    end
    it "falls back to ISO code when currency can't be found" do
      MoneyHelper.money_range_to_text(10_000, 20_000, "ITL").should eql("ITL 10,000 - 20,000")
    end
  end
end
