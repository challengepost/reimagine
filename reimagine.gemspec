# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'reimagine/version'

Gem::Specification.new do |spec|
  spec.name          = "reimagine"
  spec.version       = Reimagine::VERSION
  spec.authors       = ["Juan C. Müller"]
  spec.email         = ["jcmuller@gmail.com"]
  spec.description   = %q{ChallengePost assets}
  spec.summary       = %q{ChallengePost assets}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = Dir["{app,lib,vendor}/**/*"] + %w(LICENSE README.md)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency "railties", "~> 3.2"
  spec.add_dependency "sass"
  spec.add_dependency "bourbon"
  spec.add_dependency "neat"
end
