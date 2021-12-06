RSpec.shared_context 'common' do
  before do
    if ENV.has_key?('SERVICE_URL')
      SecurionPay::Configuration.service_url = ENV['SERVICE_URL']
    end
    SecurionPay::Configuration.secret_key = ENV['SECRET_KEY']
  end
end
