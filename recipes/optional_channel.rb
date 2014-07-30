# Example usage of rhn_channel definition.
# To use it this way with RHEL 6, make sure you have set node['rhn_channels']['rhn_user'] and node['rhn_channels']['rhn_pass']
# Note that you don't have to specify a username and password for RHEL 7

#node.override['rhn-channels']['rhn_user'] = "RHNUSERNAME"
#node.override['rhn-channels']['rhn_pass'] = "RHNPASSWORD"

platform_version = node['platform_version'].to_i

if platform_version >= 6 && platform_version < 7
	rhn_channel "rhel-x86_64-server-optional-6"
elsif platform_version >= 7 && platform_version < 8
	rhn_channel "rhel-7-server-optional-rpms"
else
	raise "This recipe currently only supports RHEL6 and RHEL7"
end

# A full definition would look like this:

# rhn_channel "rhel-x86_64-server-optional-6" do
# 	channel_name "rhel-x86_64-server-optional-6"
# 	username "RHNUSERNAME"
# 	password "RHNPASSWORD"
# end

