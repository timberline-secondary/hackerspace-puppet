## Currently Begin REfactored to use Role/Profile Paradigm

Template: https://github.com/puppetlabs/control-repo

#Puppet Environments for Timberline's Hackerspace

## Useful dirs

Environments: 
`/etc/puppetlabs/code/environments/`

Request puppet update as client:
`sudo /opt/puppetlabs/bin/puppet agent -t`

Modules location: 
`/opt/puppetlabs/puppet/modules/` (Are here but [shouldn't be](https://docs.puppet.com/puppet/4.6/reference/quick_start_module_install_nix.html#a-quick-note-about-module-directories)!)

Confdir: 
`/etc/puppetlabs/puppet`

## Configuration Files
https://docs.puppet.com/puppet/latest/reference/config_file_main.html

*nix Systems: `/etc/puppetlabs/puppet/puppet.conf`

## Certificates

### New Puppet Clients
####Client
Setup as required:
`sudo apt install puppet` (if not already installed)
`sudo nano /etc/hosts` and add: `ip puppet` (not required if DNS working)

Test connection to puppet:
`ping puppet`

Request certificate from server
`sudo /opt/puppetlabs/bin/puppet puppet agent -t`
(if this has issues, try `sudo su` to run `puppet` without path)

####Puppet server
List all certs and requests:
`sudo /opt/puppetlabs/bin/puppet cert list`

Signt he certificate:
`sudo /opt/puppetlabs/bin/puppet cert sign "hostname"`


### Broken Certificates
On client, remove cert:
`sudo find /etc/puppetlabs/puppet/ssl -name hostname.hackerspace.tbl.pem -delete`

On server, revoke client's cert:
(if problems, `sudo su` and then don't need puppet path)
`sudo /opt/puppetlabs/bin/puppet cert clean hostname.hackerspace.tbl`

On client, request new cert (see above)

If still problems running agent, such as this: `Warning: SSL_connect SYSCALL returned=5 errno=0 state=unknown state` then try removing all ssl stuff:

`rm -r /etc/puppetlabs/puppet/ssl/*`



##New Module
```
mkdir -p hs_new_module/manifests
# if files 
mkdir hs_new_module/files
sudo nano hs_new_module/manifests/init.pp
```
###Example Contents of init.pp
```
class new_module {

  file { 'printers.conf':
    path    => '/etc/cups/printers.conf',
    ensure  => file,
    source  => "puppet:///modules/new_module/printers.conf",
  }

}

```


## Puppet Forge

puppet module install camptocamp-archive --environment production

Modules are here but [shouldn't be](https://docs.puppet.com/puppet/4.6/reference/quick_start_module_install_nix.html#a-quick-note-about-module-directories)! 

`/opt/puppetlabs/puppet/modules`

## Agents

###Troubleshooting

https://docs.puppet.com/pe/latest/trouble_comms.html

###Logs

`/var/log/syslog`
`



