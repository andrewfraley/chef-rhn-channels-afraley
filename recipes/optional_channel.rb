# Example usage of rhn_channel definition.
# To use it this way, make sure you have set node['rhn_channels']['rhn_user'] and node['rhn_channels']['rhn_pass']
#node.override['rhn-channels']['rhn_user'] = "RHNUSERNAME"
#node.override['rhn-channels']['rhn_pass'] = "RHNPASSWORD"

if node['platform_version'].to_i >= 6 && node['platform_version'].to_i < 7
	rhn_channel "rhel-x86_64-server-optional-6"
else
	raise "This recipe currently only supports RHEL6"
end

# A full definition would look like this:

# rhn_channel "rhel-x86_64-server-optional-6" do
# 	channel_name "rhel-x86_64-server-optional-6"
# 	username "RHNUSERNAME"
# 	password "RHNPASSWORD"
# end