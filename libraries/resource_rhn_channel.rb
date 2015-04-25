require 'chef/resource/lwrp_base'

class Chef::Resource::RhnChannel < Chef::Resource::LWRPBase
  self.resource_name = :rhn_channel
  actions :add, :remove
  default_action :add

  attribute :channel_name, kind_of: String, name_attribute: true, required: true
  attribute :username, kind_of: String
  attribute :password, kind_of: String
end
