# frozen_string_literal: true

require_relative '../spec_helper'

describe SecurionPay::Cards do
  include_context 'with test config'

  it 'create and retrieve card' do
    # given
    customer = SecurionPay::Customers.create(TestData.customer)
    customer_id = customer['id']
    cardholder_name = random_string

    # when
    created = SecurionPay::Cards.create(customer_id,
                                        number: '4242424242424242',
                                        expMonth: '12',
                                        expYear: '2055',
                                        cvc: '123',
                                        cardholderName: cardholder_name)
    retrieved = SecurionPay::Cards.retrieve(customer_id, created['id'])

    # then
    expect(retrieved['last4']).to eq('4242')
    expect(retrieved['expMonth']).to eq('12')
    expect(retrieved['expYear']).to eq('2055')
    expect(retrieved['cardholderName']).to eq(cardholder_name)
    expect(retrieved['customerId']).to eq(customer_id)
  end

  it 'update card' do
    # given
    customer = SecurionPay::Customers.create(TestData.customer)
    card = SecurionPay::Cards.create(customer['id'], TestData.card)

    # when
    updated_card = SecurionPay::Cards.update(customer['id'], card['id'],
                                             expMonth: '05',
                                             expYear: '55',
                                             cardholderName: 'updated cardholderName',
                                             addressCountry: 'updated addressCountry',
                                             addressCity: 'updated addressCity',
                                             addressState: 'updated addressState',
                                             addressZip: 'updated addressZip',
                                             addressLine1: 'updated addressLine1',
                                             addressLine2: 'updated addressLine2')

    # then
    expect(updated_card['expMonth']).to eq('05')
    expect(updated_card['expYear']).to eq('2055')
    expect(updated_card['cardholderName']).to eq('updated cardholderName')
    expect(updated_card['addressCountry']).to eq('updated addressCountry')
    expect(updated_card['addressCity']).to eq('updated addressCity')
    expect(updated_card['addressState']).to eq('updated addressState')
    expect(updated_card['addressZip']).to eq('updated addressZip')
    expect(updated_card['addressLine1']).to eq('updated addressLine1')
    expect(updated_card['addressLine2']).to eq('updated addressLine2')
  end

  it 'delete card' do
    # given
    customer = SecurionPay::Customers.create(TestData.customer)
    card = SecurionPay::Cards.create(customer['id'], TestData.card)

    # when
    SecurionPay::Cards.delete(customer['id'], card['id'])
    deleted = SecurionPay::Cards.retrieve(customer['id'], card['id'])

    # then
    expect(deleted['deleted']).to eq(true)
  end

  it 'list cards' do
    # given
    customer1 = SecurionPay::Customers.create(TestData.customer)
    customer2 = SecurionPay::Customers.create(TestData.customer)
    card11 = SecurionPay::Cards.create(customer1['id'], TestData.card)
    card12 = SecurionPay::Cards.create(customer1['id'], TestData.card)
    card21 = SecurionPay::Cards.create(customer2['id'], TestData.card)

    # when
    customer1_cards = SecurionPay::Cards.list(customer1['id'])
    customer1_cards_limit1 = SecurionPay::Cards.list(customer1['id'], { limit: 1 })
    customer2_cards = SecurionPay::Cards.list(customer2['id'])

    # then
    expect(customer1_cards['list'].map { |card| card['id'] })
      .to contain_exactly(card11['id'], card12['id'])
    expect(customer1_cards_limit1['list'].map { |card| card['id'] })
      .to contain_exactly(card12['id'])
    expect(customer2_cards['list'].map { |card| card['id'] })
      .to contain_exactly(card21['id'])
  end
end
