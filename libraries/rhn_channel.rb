#
# Cookbook: rhn-channels
# License: MIT
#
# Copyright 2014, 2015 Andy Fraley
# Copyright 2015 Bloomberg Finance L.P.
#
require 'poise'

# Fused resource/provider for managing rhn-channel subscriptions.
#
# @since 2.0.0
class Chef::Resource::RhnChannel < Chef::Resource
  include Poise(fused: true)
  provides(:rhn_channel)
  actions(:enable, :disable)

  attribute(:channel_name,
            kind_of: String,
            name_attribute: true)
  attribute(:username,
            kind_of: [String, NilClass],
            default: nil)
  attribute(:password,
            kind_of: [String, NilClass],
            default: nil)

  def command(*args)
    options = {}
    options['-u'] = username unless username.nil?
    options['-p'] = password unless password.nil?
    options['-c'] = channel_name
    ['rhn-channel', args, options.map { |k, v| "#{k}='#{v}'" }].flatten.join(' ')
  end

  def channel_enabled?
    "rhn-channel -l | grep '#{channel_name}'"
  end

  action(:enable) do
    notifying_block do
      execute "#{new_resource.name} :create #{new_resource.channel_name}" do
        sensitive true
        command new_resource.command('-a')
        not_if new_resource.channel_enabled?
        guard_interpreter :default
      end
    end
  end

  action(:disable) do
    notifying_block do
      execute "#{new_resource.name} :delete #{new_resource.channel_name}" do
        sensitive true
        command new_resource.command('-r')
        only_if new_resource.channel_enabled?
        guard_interpreter :default
      end
    end
  end
end
