fail2ban_smartos Cookbook
==========================

Instal fail2ban to smartos and add simple rule for ssh.

Requirements
------------


Attributes
----------
TODO: List you cookbook attributes here.


Usage
-----

Just include `fail2ban_smartos` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[fail2ban_smartos]"
  ]
}
```

Install fail2ban and enable ssh rule below:

```
[ssh-ipfilter]

enabled = true
maxretry = 8
filter = sshd
action = ipfilter
logpath = /var/log/authlog
```

Contributing
------------


1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------

Authors:  Sawanobori Yukihiko(HiganWorks LLC)
