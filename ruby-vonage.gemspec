# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vonage/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby-vonage"
  spec.version       = Vonage::VERSION
  spec.author        = "Alex Watt"
  spec.email         = "alexcwatt@gmail.com"

  spec.summary       = "Use the Vonage Business API with Ruby"
  spec.homepage      = "https://github.com/alexcwatt/ruby-vonage"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
