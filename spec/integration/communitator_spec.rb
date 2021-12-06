# frozen_string_literal: true

require_relative '../spec_helper'

describe SecurionPay::Communicator do
  include_context 'with test config'

  it 'throw on bad secret key' do
    SecurionPay::Configuration.secret_key = "sk_not_existing_key"
    expect { SecurionPay::Communicator.get("/customers") }
      .to raise_error(SecurionPay::SecurionPayException) { |error|
        expect(error.response["error"]["type"]).to eq("invalid_request")
        expect(error.response["error"]["message"]).to eq("Provided API key is invalid")
      }
  end

  it 'throw on not found' do
    expect { SecurionPay::Communicator.get("/customers/cust_not_existing") }
      .to raise_error(SecurionPay::SecurionPayException) { |error|
        expect(error.response["error"]["type"]).to eq("invalid_request")
        expect(error.response["error"]["message"]).to eq("Customer 'cust_not_existing' does not exist")
      }
  end

  it 'throw on bad request' do
    expect { SecurionPay::Communicator.post("/customers", { email: "not an email" }) }
      .to raise_error(SecurionPay::SecurionPayException) { |error|
        expect(error.response["error"]["type"]).to eq("invalid_request")
        expect(error.response["error"]["message"]).to eq("email: Must be a valid email address.")
      }
  end

  it 'not throw on correct request' do
    expect { SecurionPay::Communicator.get("/customers") }
      .not_to raise_error
  end
end
