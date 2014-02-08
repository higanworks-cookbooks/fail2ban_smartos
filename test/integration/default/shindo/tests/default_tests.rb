Shindo.tests 'enable fail2ban' do
  returns(true) {
    shellout_matches?('svcs -l fail2ban', /state\s+online\n/)
  }
end
