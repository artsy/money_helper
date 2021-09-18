MoneyHelper [![CircleCI][ci_badge]][circleci]
============

A simple module to assist in formatting unambiguous prices and price ranges in international currencies in a Roman Script environment.

Usage
-----

Examples:

``` ruby
money_to_text(10000, currency: 'AUD')
#=> 'AUD $100.00'

money_to_text(10000, currency: 'AUD', with_currency: false, with_symbol: false)
#=> '100.00'

money_range_to_text(10000, 40000, currency: 'AUD')
#=> 'AUD $100.00 - 400.00'

money_range_to_text(10000, 40000, currency: 'AUD', delimiter: ' ... ')
#=> 'AUD $100.00 ... 400.00'
```

Defaults
--------

As of [#16][#16] this library explicitly specifies the `Money.locale_backend = :currency` default.

Contributing
------------

Fork the project. Make your feature addition or bug fix with tests. Send a pull request.

Copyright and License
---------------------

MIT License, see [LICENSE][license] for details.

(c) 2013-2018 [Artsy][artsy], [Sahil Yakhmi][sahil_yakhmi], [Joey Aghion][joey_aghion] and [contributors][contributors].

[ci_badge]: https://circleci.com/gh/artsy/money_helper/tree/master.svg?style=shield
[circleci]: https://circleci.com/gh/artsy/money_helper/tree/master
[#16]: https://github.com/artsy/money_helper/pull/16
[license]: LICENSE.md
[artsy]: https://github.com/artsy
[sahil_yakhmi]: https://github.com/syakhmi
[joey_aghion]: https://github.com/joeyAghion
[contributors]: CHANGELOG.md
