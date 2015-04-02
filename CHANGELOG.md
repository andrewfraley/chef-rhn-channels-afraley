rhn-channels CHANGELOG
======================

This file is used to list changes made in each version of the rhn-channels cookbook.

2.0.0
-----
- Removes default and optional-channel recipes to enforce best
practices of using encrypted data bags (ideally [chef-vault][3]) for
storing secrets. [@johnbellone][2]
- Rewrites LWRP to separate out provider logic for
different RHEL major versions. [@johnbellone][2]
- Adds suggested and required dependencies on [chef-vault][3] and
[rhn][4] cookbooks respectively. [@johnbellone][2]
- Fixes issue where sensitive data will leak in backtraces. [@johnbellone][2]

1.1.0
-----

- [Andy Fraley][1] - Added support for RHEL 7

1.0.0
-----
- [Andy Fraley][1] - Initial release of rhn-channels

- - -
Check the [Markdown Syntax Guide](http://daringfireball.net/projects/markdown/syntax) for help with Markdown.

The [Github Flavored Markdown page](http://github.github.com/github-flavored-markdown/) describes the differences between markdown on github and standard markdown.

[1]: https://github.com/andrewfraley
[2]: https://github.com/johnbellone
[3]: https://github.com/opscode-cookbooks/chef-vault
[4]: https://github.com/bflad/chef-rhn
