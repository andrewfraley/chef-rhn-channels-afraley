define :rhn_channel do
	params[:channel_name] ||= params[:name]
	raise "rhn_channel channel_name is nil" if ! params[:channel_name]
	channel_name = params[:channel_name]
	username = params[:username] ? params[:username] : node['rhn-channels']['rhn_user']
	password = params[:password] ? params[:password] : node['rhn-channels']['rhn_pass']

	if ! username || ! password
		raise "RHN username or password is nil!"
	end
	
	execute "adding rhn channel #{channel_name}" do
		command "rhn-channel -a -c #{channel_name} -u #{username} -p #{password}"
		not_if "rhn-channel --list | grep '#{channel_name}'"
	end
end