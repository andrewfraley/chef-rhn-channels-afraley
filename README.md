rhn-channels Cookbook
=================

Contains the rhn_channel definition to add RHN channels

Use the optional_channel example recipe to add the RHEL6 optional channel to a system

Usage
-----
#### LWRP
Add depends "rhn-channels" to your metadata.rb, then use the rhn_channel resource to add a channel to your system.

```ruby
rhn_channel "rhel-x86_64-server-optional-6" do
 	channel_name "rhel-x86_64-server-optional-6"
 	username "RHNUSERNAME"
 	password "RHNPASSWORD"
 end
```

License and Authors
-------------------
* License: MIT
* Author: https://github.com/andrewfraley