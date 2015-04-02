require 'chef/provider/lwrp_base'
require 'forwardable'

class Chef::Provider::RhnSubscriptionChannel < Chef::Provider::LWRPBase
  extend Forwardable
  def_delegators :@new_resource, :channel_name

  use_inline_resources if defined?(use_inline_resources)
  provides :rhn_channel

  def whyrun_enabled?
    true
  end

  action :add do
    bash "#{new_resource.name} :add rhn_channel[#{channel_name}]" do
      code "subscription_manager repos --enable='#{channel_name}'"
      not_if channel_enabled?(channel_name)
    end
  end

  action :remove do
    bash "#{new_resource.name} :remove rhn_channel[#{channel_name}]" do
      code "subscription_manager repos --disable='#{channel_name}'"
      only_if channel_enabled?(channel_name)
    end
  end

  def channel_enabled?(name)
    "subscription-manager repos --list |grep -A3 #{name}|awk '{print $2;}'|grep 1"
  end
end
