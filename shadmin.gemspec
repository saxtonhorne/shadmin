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
  s.summary     = "Rails engine for simple admin backend"
  s.description = "A simple mountable Rails engine for a simple admin backend. Think of ActiveAdmin without the DSL...and a lot less features."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'devise', '~> 3.2.2'
  s.add_dependency 'rails', '~> 4.0.2'
  s.add_dependency 'jquery-rails', '~> 3.0.4'
  s.add_dependency 'compass-rails'
  s.add_dependency 'sass-rails'
  s.add_dependency 'kaminari'

  # Testing
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'minitest-colorize'

  s.add_development_dependency 'pg'
  s.add_development_dependency 'thin'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'letter_opener'
end
