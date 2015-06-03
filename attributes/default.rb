#
# Cookbook: rhn-channels
# License: MIT
#
# Copyright 2014, 2015 Andy Fraley
# Copyright 2015 Bloomberg Finance L.P.
#
if node['platform'] == 'redhat'
  case node['platform_version'].to_i
  when 5
    default['rhn-channels']['optional'] = nil
    default['rhn-channels']['supplementary'] = 'rhel-x86_64-server-supplementary-5'
  when 6
    default['rhn-channels']['optional'] = 'rhel-x86_64-server-optional-6'
    default['rhn-channels']['supplementary'] = 'rhel-x86_64-server-supplementary-6'
  when 7
    default['rhn-channels']['optional'] = 'rhel-x86_64-server-optional-7'
    default['rhn-channels']['supplementary'] = 'rhel-x86_64-server-supplementary-7'
  end
end
