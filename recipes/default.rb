git "#{Chef::Config[:file_cache_path]}/fail2ban_smartos" do
  repository node[:fail2ban_smartos][:git_repo]
  reference node[:fail2ban_smartos][:git_ref]
  action :sync
  notifies :run, 'bash[install_fail2ban]', :immediately
end

file '/etc/fail2ban.conf' do
  action :delete
end


bash 'install_fail2ban' do
  action :nothing
  flags '-ex'
  path ['opt/local/bin', '/opt/local/sbin']
  cwd "#{Chef::Config[:file_cache_path]}/fail2ban_smartos"
  code <<-EOH
  python setup.py install
  svccfg import files/solaris-fail2ban.xml
  mkdir -p /var/svc/method
  cp files/solaris-svc-fail2ban /var/svc/method/svc-fail2ban
  chmod +x /var/svc/method/svc-fail2ban
  EOH
end


service 'fail2ban' do
  action [:enable]
  reload_command '/opt/local/bin/fail2ban-client reload'
end

