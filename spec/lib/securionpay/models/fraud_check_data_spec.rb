require 'spec_helper'

describe Securionpay::Models::FraudCheckData do
  let(:ip_address) { double }
  let(:ip_country) { double }
  let(:email) { double }
  let(:user_agent) { double }
  let(:accept_language) { double }

  subject do
    described_class.new(
      ip_address,
      ip_country,
      email,
      user_agent,
      accept_language
    )
  end

  it 'checks propreties' do
    expect(subject.ip_address).to be(ip_address)
    expect(subject.ip_country).to be(ip_country)
    expect(subject.email).to be(email)
    expect(subject.user_agent).to be(user_agent)
    expect(subject.accept_language).to be(accept_language)
  end
end
