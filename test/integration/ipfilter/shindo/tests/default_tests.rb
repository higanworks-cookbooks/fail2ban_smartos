Shindo.tests 'monitored ssh by ipfilter' do
  tests 'jail list includes ssh-ipfilter' do
    returns(true) {
      shellout_matches?('/opt/local/bin/fail2ban-client status', /ssh-ipfilter/)
    }
  end
end
