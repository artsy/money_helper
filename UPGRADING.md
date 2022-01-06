Upgrading MoneyHelper
=====================

### Upgrading to >= 3.0.0

#### `money_to_text` format options

Prior to 3.0.0 `money_to_text` took a named argument `with_symbol`. The default value was `true` and assing `false` would omit the currency symbol.

This data was later passed to the `Money#format` method with a default `format` string of `'%u%n'`. Users of `MoneyHelper` could not modify the format string or utilize additional format options, such as `no_cents: false`.

In 3.0.0 this was changed so `money_to_text` can take an optional `format` argument which is eventually passed to `Money#format` with only the slight modification of adding in `format: '%u%n'` if this key is not present.

### Upgrading to >= 2.0.0

#### `money_to_text` amount is now given in minor units

Prior to 2.0.0 `money_to_text` took an amount in a currency's major units and converted this value internally before passing to `Money#new` which expects values in their minor unit (i.e. For USD the major unit is Dollars and the minor unit is Cents). This version removes the autoscaling so `money_to_text` can take amounts in their minor units.

Additionally, `currency`, `number_only`, and `options` were removed as postional arguments and replaced with named arguments `currency`, `with_currency`, and `with_symbol` with `'USD'`, `true` and `true` as their default arguments respectively.

One minor difference is that `currency` can be omited completely where as in < 2.0.0 `''` or `nil` was required to be passed for the default of `'USD'` to be used.

Finally the automatic omission of certain currency codes (USD, GBP, EUR, and MYR) is no longer supported. To replicate this behavior you must explicitly specify `with_currency: false`.

The following illustrates the primary difference in usage.

```ruby
# Before 2.0.0

MoneyHelper.money_to_text(123, 'USD')
# => $123

# After 2.0.0

MoneyHelper.money_to_text(123) # `currency: 'USD'` is the default
# => USD $1.23

# to replicate previous behavior almost exactly
MoneyHelper.money_to_text(12300, with_currency: false)
# => $123.00

# Note the inclusion of the cents. The ability to remove this was added in 3.0.0 as another breaking change
```