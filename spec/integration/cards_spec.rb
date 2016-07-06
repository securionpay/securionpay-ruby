require 'spec_helper'

describe SecurionPay::Cards do
  before do
    SecurionPay::Configuration.private_key = ENV['PRIVATE_KEY']
  end

  it 'create and retrieve credit card' do
    customer = SecurionPay::Customers.create({
      email: random_email
    })
    cardholder_name = random_string

    card = SecurionPay::Cards.create(customer['id'], {
      number: '4242424242424242',
      expMonth: '12',
      expYear: '2020',
      cvc: '123',
      cardholderName: cardholder_name
    })

    card = SecurionPay::Cards.retrieve(card['customerId'], card['id'])
    expect(card['last4']).to eq('4242')
    expect(card['expMonth']).to eq('12')
    expect(card['expYear']).to eq('2020')
    expect(card['cardholderName']).to eq(cardholder_name)
  end
end
