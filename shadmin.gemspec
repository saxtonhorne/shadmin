$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "shadmin/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "shadmin"
  s.version     = Shadmin::VERSION
  s.authors     = ["Adam Jacox"]
  s.email       = ["yellowjacox@gmail.com"]
  s.homepage    = "http://github.com/saxtonhorne/shadmin"
  s.summary     = "Mountable Rails engine for simple admin backend"
  s.description = "Mountable Rails engine for simple admin backend"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'devise'
  s.add_dependency "rails", "~> 4.0.2"

  # Testing
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'factory_girl_rails'

  s.add_development_dependency 'pg'
  s.add_development_dependency 'thin'
  s.add_development_dependency 'pry'
end
