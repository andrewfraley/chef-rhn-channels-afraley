require 'chef/provider/lwrp_base'
require 'forwardable'

class Chef::Provider::RhnChannel < Chef::Provider::LWRPBase
  extend Forwardable
  def_delegators :@new_resource, :channel_name, :username, :password

  use_inline_resources if defined?(use_inline_resources)
  provides :rhn_channel

  def whyrun_enabled?
    true
  end

  action :add do
    bash "#{new_resource.name} :add rhn_channel[#{channel_name}]" do
      sensitive true
      code "rhn-channel -a -u '#{username}' -p '#{password}' -c '#{channel_name}'"
      not_if channel_enabled?(channel_name)
    end
  end

  action :remove do
    bash "#{new_resource.name} :remove rhn_channel[#{channel_name}]" do
      sensitive true
      code "rhn-channel -r -u '#{username}' -p '#{password}' -c '#{channel_name}'"
      only_if channel_enabled?(channel_name)
    end
  end

  def channel_enabled?(name)
    "rhn-channel -l | grep '#{name}'"
  end
end
