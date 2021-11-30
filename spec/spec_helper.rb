require 'simplecov'
require_relative 'support/shared_examples'
require_relative 'support/random_data'

SimpleCov.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'securionpay'

RSpec.configure do |config|
  config.color = true
end
