Shindo.tests 'monitored ssh by tcp wrapper' do
  tests 'tcp wrapper enabled' do
    returns(true) {
      shellout_matches?('inetadm -p', /tcp_wrappers=TRUE/)
    }
  end
  tests 'jail list includes ssh-tcp_wrapper' do
    returns(true) {
      shellout_matches?('/opt/local/bin/fail2ban-client status', /ssh-tcp_wrapper/)
    }
  end
end
