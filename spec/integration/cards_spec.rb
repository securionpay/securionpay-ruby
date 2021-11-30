require 'spec_helper'

describe SecurionPay::Cards do
  before do
    SecurionPay::Configuration.secret_key = ENV['SECRET_KEY']
  end

  it 'create and retrieve credit card' do
    customer = SecurionPay::Customers.create({
      email: random_email
    })
    cardholder_name = random_string

    card = SecurionPay::Cards.create(customer['id'], {
      number: '4242424242424242',
      expMonth: '12',
      expYear: Time.new.year,
      cvc: '123',
      cardholderName: cardholder_name
    })

    card = SecurionPay::Cards.retrieve(card['customerId'], card['id'])
    expect(card['last4']).to eq('4242')
    expect(card['expMonth']).to eq('12')
    expect(card['expYear']).to eq(Time.new.year.to_s)
    expect(card['cardholderName']).to eq(cardholder_name)
  end
end
