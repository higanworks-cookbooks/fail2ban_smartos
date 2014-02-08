include_recipe 'fail2ban_smartos::default'

bash 'enable_tcpwrepper' do
  action :run
  flags '-ex'
  path ['opt/local/bin', '/opt/local/sbin']
  code <<-EOH
  /usr/sbin/inetadm -M tcp_wrappers=true
  EOH
  only_if 'inetadm -p | grep tcp_wrappers=FALSE'
end

execute 'sleep 3' do
  ## need wait when inetadm policy has changed..?
  action :nothing
end

template '/etc/fail2ban/jail.local' do
  source 'jail.local_tcpr.erb'
  action :create
  notifies :run,    'execute[sleep 3]', :immediately
  notifies :reload, 'service[fail2ban]'
end

