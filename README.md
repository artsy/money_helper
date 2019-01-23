MoneyHelper
============

A simple module to assist in formatting unambiguous prices and price ranges in international currencies in a Roman Script environment.

[![Build Status](https://travis-ci.org/artsy/money_helper.svg?branch=master)](https://travis-ci.org/artsy/money_helper)

Usage
-----

Examples:

``` ruby
money_to_text(10000, 'AUD')
```
produces "AUD $10,000"

``` ruby
money_to_text(10000, 'AUD', true)
```
produces "10,000"

``` ruby
money_range_to_text(10000, 40000, 'AUD', ' ... ')
```
produces: "AUD $10,000 ... 40,000"

Defaults
--------

As of [#16](https://github.com/artsy/money_helper/pull/16) this library explicitly specifies the `Money.locale_backend = :currency` default.

Contributing
------------

Fork the project. Make your feature addition or bug fix with tests. Send a pull request.

Copyright and License
---------------------

MIT License, see [LICENSE](LICENSE.md) for details.

(c) 2013-2018 [Artsy](http://artsy.github.com), [Sahil Yakhmi](https://github.com/syakhmi), [Joey Aghion](https://github.com/joeyAghion) and [contributors](CHANGELOG.md).
