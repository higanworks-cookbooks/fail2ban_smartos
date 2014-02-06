include_recipe 'fail2ban_smartos::default'

template '/etc/fail2ban/jail.local' do
  source 'jail.local_ipfilter.erb'
  action :create
  notifies :reload, 'service[fail2ban]'
end

