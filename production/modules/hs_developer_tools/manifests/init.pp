class hs_developer_tools {
	notify { 'Puppet Module - Developer Tools': }
	
	package { 'git': 
          ensure  => latest,
        }
}
