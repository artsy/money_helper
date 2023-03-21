### 3.0.1 (Next)

* [#29](https://github.com/artsy/money_helper/pull/29): Update `money_range_to_text` to receive `with_currency` parameter for optional ISO code printing - [@leamotta](https://github.com/leamotta).
* Your contribution here.

### 3.0.0 (2022-02-16)

* [#27](https://github.com/artsy/money_helper/pull/27): Update `money_to_text` to pass `format` options to `Money#format` for additional features such as `no_cents` - [@agrberg](https://github.com/agrberg).

### 2.0.0 (2021-09-20)

#### Breaking Changes

* [#20](https://github.com/artsy/money_helper/pull/20): Update `money_to_text` and `money_range_to_text` to expect amounts in minor unit and simplify formatting; drop support for Ruby 2.3 and 2.4 - [@starsirius](https://github.com/starsirius)

### 1.0.2 (2019-04-19)

* [#16](https://github.com/artsy/money_helper/pull/16): Remove deprecation warnings - [@sweir27](https://github.com/sweir27).
* [#15](https://github.com/artsy/money_helper/pull/15): Added Rubocop - [@dblock](https://github.com/dblock).

### 1.0.1 (2017-04-03)

* Relaxed activesupport version dependency - [@dblock](https://github.com/dblock).
* The `money_to_text` method now takes options - [@mzikherman](https://github.com/mzikherman).
* Added `symbol_with_optional_iso_code` - [@mzikherman](https://github.com/mzikherman).

### 1.0.0 (2015-03-07)

* Added compatibility with Money 6.5.1+, including new currency symbols - [@syakhmi](https://github.com/syakhmi).

### 0.0.5 (2014-04-12)

* Added compatibility with Money 6.1+ - [@syakhmi](https://github.com/syakhmi).
* Dropped support for pre 6.0 versions of Money - [@syakhmi](https://github.com/syakhmi).

### 0.0.4 (2014-01-08)

* Added compatibility with Money 6.x - [@dblock](https://github.com/dblock).
* Avoid failing on deprecated currencies (such as ITL) - [@joeyAghion](https://github.com/joeyAghion).

### 0.0.3 (2013-07-17)

* Added support for currencies that don't have a symbol, eg. Uzbekistan Som (UZS) - [@dblock](https://github.com/dblock).

### 0.0.2 (2013-07-16)

* Added unit tests - [@syakhmi](https://github.com/syakhmi).
* Added support for Cambodian riel - [@syakhmi](https://github.com/syakhmi).
* Added dependencies to gemspec - [@syakhmi](https://github.com/syakhmi).
* Now defaults to USD when currency not specified - [@syakhmi](https://github.com/syakhmi).

### 0.0.1 (2013-07-12)

* Initial public release - [@syakhmi](https://github.com/syakhmi).
