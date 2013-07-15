money_helper
============

A simple class to assist in formatting unambiguous prices and price ranges in international currencies

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
money_to_text(10000, 40000, 'AUD', ' ... ')
```
produces: "AUD $10,000 - 40,000"

Contributing
------------

Fork the project. Make your feature addition or bug fix with tests. Send a pull request.

Copyright and License
---------------------

MIT License, see [LICENSE](LICENSE.md) for details.

(c) 2013 [Artsy](http://artsy.github.com), [Sahil Yakhmi](https://github.com/fancyremarker), [Daniel Doubrovkine](https://github.com/dblock) and [contributors](CHANGELOG.md).
