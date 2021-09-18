# Releasing money_helper

There are no hard rules about when to release money_helper. Release bug fixes frequently, features not so frequently and breaking API changes rarely.

### Release

Run tests, check that all tests succeed locally.

```
bundle install
rake
```

Check that the last build succeeded on [CI][ci] for all supported platforms.

Change "Next" in [CHANGELOG.md][changelog] to the current date.

```
### 0.2.2 (2015/7/10)
```

Remove the line with "Your contribution here.", since there will be no more contributions to this release.

Commit your changes.

```
git add CHANGELOG.md
git commit -m "Preparing for release, 0.2.2."
git push origin master
```

Release.

```
$ rake release

money_helper 0.2.2 built to pkg/money_helper-0.2.2.gem.
Tagged v0.2.2.
Pushed git commits and tags.
Pushed money_helper 0.2.2 to rubygems.org.
```

### Prepare for the Next Version

Add the next release to [CHANGELOG.md][changelog].

```
### 0.2.3 (Next)

* Your contribution here.
```

Increment the third version number in [lib/version.rb][version].

Commit your changes.

```
git add CHANGELOG.md lib/version.rb
git commit -m "Preparing for next development iteration, 0.2.3."
git push origin master
```

[ci]: https://circleci.com/gh/artsy/money_helper/tree/master
[changelog]: CHANGELOG.md
[version]: lib/version.rb
