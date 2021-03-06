define :rhn_channel, :action => :add do

  params[:channel_name] ||= params[:name]
  raise "rhn_channel channel_name is nil" if ! params[:channel_name]
  channel_name = params[:channel_name]

  if node['platform_version'].to_i < 7
    username = node['rhn-channels']['rhn_user']
    password = node['rhn-channels']['rhn_pass']

    if params[:action] == :add
      execute "adding rhn channel #{channel_name}" do
        command "rhn-channel -a -c #{channel_name} -u #{username} -p #{password}"
        not_if "rhn-channel --list | grep '#{channel_name}'"
      end

    elsif params[:action] == :remove
      execute "removing rhn channel #{channel_name}" do
        command "rhn-channel -r -c #{channel_name} -u #{username} -p #{password}"
        only_if "rhn-channel --list | grep '#{channel_name}'"
      end
    end

  else
    if params[:action] == :add
      execute "adding subscription-manager repo #{channel_name}" do
        command "subscription-manager repos --enable=#{channel_name}"
        not_if "subscription-manager repos --list | grep -A3 #{channel_name} | grep Enabled | awk '{print $2;}' | grep 1"
      end

    elsif params[:action] == :remove
      execute "adding subscription-manager repo #{channel_name}" do
        command "subscription-manager repos --disable=#{channel_name}"
        only_if "subscription-manager repos --list | grep -A3 #{channel_name} | grep Enabled | awk '{print $2;}' | grep 1"
      end
    end
  end

end
