rhn-channels cookbook
=====================
Manages RHN channel subscription using provided LWRP. This cookbook
does not manage the RHN registration itself. Please use the
[rhn cookbook][1] for that.

# Usage
This cookbook provides the Chef LWRP *rhn_channel* for managing
subscriptions to satellite server channels in addition to the ones
that are subscribed by default.

## Example for adding the supplementary channel for EL5 and EL6.
Older versions of RHEL require the username and password in order
to subscribe an instance to a new channel. This example uses the
[chef-vault cookbook][2] which is suggested to manage your secrets.

```ruby
bag = chef_vault_item('secrets', 'rhn')
rhn_channel node['rhn-channels']['supplementary'] do
  username bag['rhn_username']
  password bag['rhn_password']
end
```

## Example for adding supplementary channel for EL7.
Because the subscription manager handles credentials it is much,
much simpler to subscribe to a channel. There is a different
provider that manages the EL7 channel registration.
```ruby
rhn_channel node['rhn-channels']['supplementary']
```

It is important to note that the correct provider will be used
for the platform. Even if username and password credentials are
stored and passed in they will be ignored in EL7.

## Removing channels
As you would expect removing a channel is simply a different
action on the resource. For anything prior to EL7 the credentials
must be supplied. This example will work for all versions of RHEL
as long as the *optional attribute* is defined.
```ruby
bag = chef_vault_item('secrets', 'rhn')
rhn_channel node['rhn-channels']['optional'] do
  username bag['rhn_username']
  password bag['rhn_password']
end
```

License and Authors
-------------------
* License: MIT
* Author: [Tenyo Grozev][3] (tenyo.grozev@yale.edu)
* Author: [John Bellone][4] (jbellone@bloomberg.net)

[1]: https://github.com/bflad/chef-rhn
[2]: https://github.com/opscode-cookbooks/chef-vault
[3]: https://github.com/andrewfraley
[4]: https://github.com/johnbellone
