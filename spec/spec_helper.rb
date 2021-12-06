require 'dotenv/load'
require 'simplecov'
require 'waitutil'

require_relative 'support/common_context'
require_relative 'support/random_data'
require_relative 'support/test_data'
require_relative 'support/matchers'

SimpleCov.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'securionpay'

RSpec.configure do |config|
  config.color = true
end
