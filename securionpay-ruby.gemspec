# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'securionpay/version'

Gem::Specification.new do |spec|
  spec.name          = "securionpay"
  spec.version       = SecurionPay::VERSION
  spec.authors       = ["Grzegorz Wilczynski"]
  spec.email         = ["support@securionpay.com"]

  spec.summary       = "SecurionPay ruby gem"
  spec.description   = "SecurionPay ruby gem"
  spec.homepage      = "https://securionpay.com"

  spec.files         = Dir['lib/**/*.rb'] + Dir['bin/*']
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'httparty', '~> 0.20'
  spec.add_development_dependency 'bundler', '~> 2.2'
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "mutant-rspec", "~> 0.11"
  spec.add_development_dependency "rspec", "~> 3.10"
  spec.add_development_dependency "pry", "~> 0.14"
  spec.add_development_dependency "simplecov", "~> 0.21"
end
