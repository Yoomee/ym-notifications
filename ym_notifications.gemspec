$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ym_notifications/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ym_notifications"
  s.version     = YmNotifications::VERSION
  s.authors     = ["Matt Atkins", "Ian Mooney", "Edward Andrews"]
  s.email       = ["matt@yoomee.com", "ian@yoomee.com", "edward@yoomee.com"]
  s.homepage    = "http://www.yoomee.com"
  s.summary     = "Summary of YmNotifications."
  s.description = "Description of YmNotifications."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'ym_core', "~> 1.0"
  s.add_dependency "ym_users", "~> 1.0"

  # for testing
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "geminabox"
  s.add_development_dependency "ym_tools", '~> 0.1.13'

end