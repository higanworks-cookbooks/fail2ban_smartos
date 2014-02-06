default[:fail2ban_smartos][:git_repo] = 'https://github.com/ZCloud-Firstserver/fail2ban.git'
default[:fail2ban_smartos][:git_ref]  = 'smartos_0.8.12'


default[:fail2ban_smartos][:example][:ssh_maxretry]  = 8
default[:fail2ban_smartos][:example][:ssh_log_file]  = '/var/log/authlog'
