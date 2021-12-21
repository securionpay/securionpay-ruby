# frozen_string_literal: true

require_relative '../spec_helper'

describe SecurionPay::Communicator do
  include_context 'with test config'

  let(:url) { SecurionPay::Configuration.service_url }

  it 'throw on bad secret key' do
    SecurionPay::Configuration.secret_key = "sk_not_existing_key"
    expect { SecurionPay::Communicator.get("#{url}/customers") }
      .to raise_error(SecurionPay::SecurionPayException) { |error|
        expect(error.response["error"]["type"]).to eq("invalid_request")
        expect(error.response["error"]["message"]).to eq("Provided API key is invalid")
      }
  end

  it 'throw on not found' do
    expect { SecurionPay::Communicator.get("#{url}/customers/cust_not_existing") }
      .to raise_error(SecurionPay::SecurionPayException) { |error|
        expect(error.response["error"]["type"]).to eq("invalid_request")
        expect(error.response["error"]["message"]).to eq("Customer 'cust_not_existing' does not exist")
      }
  end

  it 'throw on bad request' do
    expect { SecurionPay::Communicator.post("#{url}/customers", json: { email: "not an email" }) }
      .to raise_error(SecurionPay::SecurionPayException) { |error|
        expect(error.response["error"]["type"]).to eq("invalid_request")
        expect(error.response["error"]["message"]).to eq("email: Must be a valid email address.")
      }
  end

  it 'delegate error[] to response[]' do
    expect { SecurionPay::Communicator.post("#{url}/customers", json: { email: "not an email" }) }
      .to raise_error(SecurionPay::SecurionPayException) { |error|
        expect(error["error"]["type"]).to eq(error.response["error"]["type"])
        expect(error["error"]["type"]).to eq("invalid_request")
      }
  end

  it 'not throw on correct request' do
    expect { SecurionPay::Communicator.get("#{url}/customers") }
      .not_to raise_error
  end
end
