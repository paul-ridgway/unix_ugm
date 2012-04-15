Gem::Specification.new do |s|
  s.name        = 'unix_ugm'
  s.version     = '0.0.6'
  s.date        = '2012-04-15'
  s.summary     = "Unix User/Group Manager"
  s.description = "A manager for unix users and group to control /etc/passwd and /etc/group"
  s.authors     = ["Paul Ridgway"]
  s.email       = 'myself@paulridgway.co.uk'
  s.files       = [
			"lib/unix_ugm.rb",
			"lib/unix_user.rb",
			"lib/unix_group.rb",
			"lib/command.rb",
		  ]
  s.homepage    = 'https://github.com/abstract-void/unix_ugm'
end
