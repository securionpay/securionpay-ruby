# frozen_string_literal: true

RSpec.shared_context 'with test config' do
  before do
    SecurionPay::Configuration.service_url = ENV['SERVICE_URL'] if ENV.key?('SERVICE_URL')
    SecurionPay::Configuration.secret_key = ENV['SECRET_KEY']
  end
end
