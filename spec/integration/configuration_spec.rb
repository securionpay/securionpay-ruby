# frozen_string_literal: true

require_relative '../spec_helper'

describe SecurionPay::Communicator do
  it 'trim trailing slash in service_url' do
    SecurionPay::Configuration.service_url = "http://ddsadsa.dsadas/"
    expect(SecurionPay::Configuration.service_url).to eq("http://ddsadsa.dsadas")
  end

  it 'trim trailing slash in uploads_url' do
    SecurionPay::Configuration.uploads_url = "http://ddsadsa.dsadas/"
    expect(SecurionPay::Configuration.uploads_url).to eq("http://ddsadsa.dsadas")
  end
end
