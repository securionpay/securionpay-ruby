require 'spec_helper'

describe SecurionPay::Communicator do
  before do
    SecurionPay::Configuration.secret_key = ENV['SECRET_KEY']
  end

  it 'should throw on bad secret key' do
    SecurionPay::Configuration.secret_key = "sk_not_existing_key"
    expect { SecurionPay::Communicator::get("/customers") }
      .to raise_error(SecurionPay::SecurionPayException) { |error|
        expect(error.response["error"]["type"]).to eq("invalid_request")
        expect(error.response["error"]["message"]).to eq("Provided API key is invalid")
      }
  end

  it 'should throw on not found' do
    expect { SecurionPay::Communicator::get("/customers/cust_not_existing") }
      .to raise_error(SecurionPay::SecurionPayException) { |error|
        expect(error.response["error"]["type"]).to eq("invalid_request")
        expect(error.response["error"]["message"]).to eq("Customer 'cust_not_existing' does not exist")
      }
  end

  it 'should throw on bad request' do
    expect { SecurionPay::Communicator::post("/customers", { email: "not an email" }) }
      .to raise_error(SecurionPay::SecurionPayException) { |error|
        expect(error.response["error"]["type"]).to eq("invalid_request")
        expect(error.response["error"]["message"]).to eq("email: Must be a valid email address.")
      }
  end

  it 'should not throw on correct request' do
    expect { SecurionPay::Communicator::get("/customers") }
      .to_not raise_error
  end
end
