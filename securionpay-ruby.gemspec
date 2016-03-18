# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'securionpay/version'

Gem::Specification.new do |spec|
  spec.name          = "securionpay-ruby"
  spec.version       = Securionpay::VERSION
  spec.authors       = ["Grzegorz Wilczynski"]
  spec.email         = ["support@securionpay.com"]

  spec.summary       = "SecurionPay ruby gem"
  spec.description   = "SecurionPay ruby gem"
  spec.homepage      = "https://securionpay.com"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "codeclimate-test-reporter", "~> 0.5"
end
