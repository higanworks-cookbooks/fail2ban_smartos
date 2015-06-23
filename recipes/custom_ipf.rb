script "point ipfilter service at our .conf file" do
  interpreter "bash"
  user "root"
  code <<-EOH
  svccfg -s network/ipfilter:default setprop firewall_config_default/policy = astring: custom
  svccfg -s network/ipfilter:default setprop firewall_config_default/custom_policy_file = astring: "/etc/ipf/ipf.conf"
  svcadm refresh ipfilter
  EOH
  not_if "svccfg -s network/ipfilter:default listprop firewall_config_default/policy | grep custom"
end

