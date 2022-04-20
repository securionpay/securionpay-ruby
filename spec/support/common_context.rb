# frozen_string_literal: true

RSpec.shared_context 'with test config' do
  before do
    SecurionPay::Configuration.api_url = ENV.fetch('API_URL', nil)
    SecurionPay::Configuration.uploads_url = ENV.fetch('UPLOADS_URL', nil)
    SecurionPay::Configuration.secret_key = ENV.fetch('SECRET_KEY')
  end
end
