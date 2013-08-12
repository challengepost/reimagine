$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "reimagine/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "reimagine"
  s.version     = Reimagine::VERSION
  s.authors     = ["ChallengePost, Inc."]
  s.email       = ["tech@challengepost.com"]
  s.homepage    = "http://challengepost.com"
  s.summary     = "An assets gem"
  s.description = "Shared assets, in a gem."

  s.files = Dir["{app,config,lib,vendor}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 3.2"
  s.add_dependency "sass-rails"
  s.add_dependency "compass-rails"
  s.add_dependency "coffee-rails"
  s.add_dependency "zurb-foundation", "~> 4"

  s.add_development_dependency "rspec-rails", '~> 2.0'
  s.add_development_dependency "steak"
  s.add_development_dependency "launchy"
  s.add_development_dependency "pry"
  s.add_development_dependency "pry-debugger"
end
