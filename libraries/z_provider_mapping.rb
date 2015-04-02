Chef::Platform.set platform: :redhat, version: '< 7.0', resource: :rhn_channel, provider: Chef::Provider::RhnSubscriptionChannel
Chef::Platform.set platform: :redhat, version: '>= 7.0', resource: :rhn_channel, provider: Chef::Provider::RhnChannel
