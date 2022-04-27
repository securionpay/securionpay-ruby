# frozen_string_literal: true

require_relative 'lib/securionpay/version'

Gem::Specification.new do |spec|
  spec.name = "securionpay"
  spec.version = SecurionPay::VERSION
  spec.authors = ["SecurionPay Team"]
  spec.email = ["support@securionpay.com"]
  spec.required_ruby_version = '>= 2.6'
  spec.licenses = ['MIT']

  spec.summary = "SecurionPay ruby gem"
  spec.description = "Ruby gem simplifying integration with SecurionPay API"
  spec.homepage = "https://securionpay.com"

  spec.files = Dir['lib/**/*.rb'] + Dir['bin/*']
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'httparty', '~> 0.20'

  spec.add_development_dependency 'bundler', '~> 2.2'
  spec.add_development_dependency "dotenv", "~> 2.1"
  spec.add_development_dependency "pry", "~> 0.14"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.10"
  spec.add_development_dependency "rubocop-performance", "~> 1.12"
  spec.add_development_dependency 'rubocop-rake', '~> 0.5.1'
  spec.add_development_dependency 'rubocop-rspec', '~> 2.6'
  spec.add_development_dependency "simplecov", "~> 0.21"
  spec.add_development_dependency "waitutil", "~> 0.2.1"
end
