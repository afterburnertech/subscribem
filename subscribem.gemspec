$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "subscribem/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "subscribem"
  s.version     = Subscribem::VERSION
  s.authors     = ["Test Pilot"]
  s.email       = ["brandon@afterburnertechnologies.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Subscribem."
  s.description = "TODO: Description of Subscribem."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.13"
  # s.add_dependency "jquery-rails"
  s.add_dependency "warden", "1.2.1"
  s.add_dependency "bcrypt-ruby", "3.0.1"
  #error messages for forms
  s.add_dependency "dynamic_form", "1.1.4"
  s.add_dependency 'apartment', '0.21.1'

  s.add_development_dependency "pg"
  s.add_development_dependency 'rspec-rails', '2.12.2'
  s.add_development_dependency 'capybara', '2.1.0'
  s.add_development_dependency "factory_girl", "4.1.0"
  s.add_development_dependency 'annotate', '2.5.0' #used to annotate Models 'bundle exec annotate'
  #used instead of 'transactional_fixtures' (spec_helper.rb)
  s.add_development_dependency "database_cleaner", "0.9.1"

end
