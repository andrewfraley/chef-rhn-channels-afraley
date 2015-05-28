#
# Cookbook: rhn-channels
# License: MIT
#
# Copyright 2014, 2015 Andy Fraley
# Copyright 2015 Bloomberg Finance L.P.
#
require 'poise'

# Fused resource/provider for managing RHN subscriptions on EL7.
#
# @since 2.1.0
class Chef::Resource::RhnSubscription < Chef::Resource
  include Poise(fused: true)
  actions(:enable, :disable)
  provides(:rhn_subscription)

  attribute(:channel_name,
            kind_of: String,
            name_attribute: true,
            cannot_be: :empty)

  def channel_enabled?
    "subscription-manager repos --list |grep -A3 #{channel_name}|awk '{print $2;}'|grep 1"
  end

  action(:enable) do
    notifying_block do
      execute "#{new_resource.name} :create #{new_resource.channel_name}" do
        command "subscription-manager repos --enable='#{new_resource.channel_name}'"
        not_if new_resource.channel_enabled?
      end
    end
  end

  action(:disable) do
    notifying_block do
      execute "#{new_resource.name} :delete #{new_resource.channel_name}" do
        command "subscription-manager repos --disable='#{new_resource.channel_name}'"
        only_if new_resource.channel_enabled?
      end
    end
  end
end
