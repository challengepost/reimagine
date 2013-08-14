# coding: utf-8
$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "reimagine2/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "reimagine2"
  spec.version     = Reimagine2::VERSION
  spec.authors     = ["ChallengePost, Inc."]
  spec.email       = ["tech@challengepost.com"]
  spec.homepage    = "http://challengepost.com"
  spec.summary     = "An assets gem"
  spec.description = "Shared assets, in a gem."

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rails"
  spec.add_dependency "sass-rails"
  spec.add_dependency "compass-rails", "~> 2.0.alpha.0"
  spec.add_dependency "coffee-rails"
  spec.add_dependency "zurb-foundation", "~> 4"

  spec.add_development_dependency "rspec-rails", '~> 2.0'
  spec.add_development_dependency "steak"
  spec.add_development_dependency "launchy"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-debugger"
  spec.add_development_dependency "gemfury"
end
