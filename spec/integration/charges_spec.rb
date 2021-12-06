# frozen_string_literal: true

require_relative '../spec_helper'

describe SecurionPay::Charges do
  include_context 'with test config'

  it 'create and retrieve charge' do
    # given
    charge_req = TestData.charge(card: TestData.card)

    # when
    created = SecurionPay::Charges.create(charge_req)
    retrieved = SecurionPay::Charges.retrieve(created['id'])

    # then
    expect(retrieved['amount']).to eq(charge_req["amount"])
    expect(retrieved['currency']).to eq(charge_req["currency"])
    expect(retrieved['description']).to eq(charge_req["description"])
    expect(retrieved['card']['first4']).to eq(charge_req["card"]["first4"])
  end

  it 'update charge' do
    # given
    card = TestData.card
    charge_req = TestData.charge(card: card)

    # when
    created = SecurionPay::Charges.create(charge_req)
    updated = SecurionPay::Charges.update(created['id'],
                                          "description" => "updated description",
                                          "metadata" => { "key" => "updated value" })

    # then
    expect(created['description']).to eq(charge_req["description"])
    expect(updated['description']).to eq('updated description')

    expect(created['metadata']['key']).to eq(charge_req["metadata"]["key"])
    expect(updated['metadata']['key']).to eq('updated value')

    expect(updated['amount']).to eq(charge_req["amount"])
    expect(updated['currency']).to eq(charge_req["currency"])
    expect(updated['card']['first4']).to eq(charge_req["card"]["first4"])
  end

  it 'capture charge' do
    # given
    charge_req = TestData.charge(card: TestData.card, captured: false)
    created = SecurionPay::Charges.create(charge_req)

    # when
    captured = SecurionPay::Charges.capture(created['id'])

    # then
    expect(created['captured']).to eq(false)
    expect(captured['captured']).to eq(true)
  end

  it 'refund charge' do
    # given
    charge_req = TestData.charge(card: TestData.card, captured: false)
    created = SecurionPay::Charges.create(charge_req)

    # when
    refunded = SecurionPay::Charges.refund(created['id'])

    # then
    expect(created['refunded']).to eq(false)
    expect(refunded['refunded']).to eq(true)
  end

  it 'list charges' do
    # given
    customer = SecurionPay::Customers.create(TestData.customer)
    charge_req = TestData.charge(card: TestData.card, customer_id: customer['id'])
    charge1 = SecurionPay::Charges.create(charge_req)
    charge2 = SecurionPay::Charges.create(charge_req)
    charge3 = SecurionPay::Charges.create(charge_req)

    # when
    all_charges = SecurionPay::Charges.list({ customerId: customer['id'] })
    charges_after_last_id = SecurionPay::Charges.list({ customerId: customer['id'], startingAfterId: charge3['id'] })

    # then
    expect(all_charges['list'].map { |charge| charge['id'] })
      .to contain_exactly(charge1['id'], charge2['id'], charge3['id'])

    expect(charges_after_last_id['list'].map { |charge| charge['id'] })
      .to contain_exactly(charge1['id'], charge2['id'])
  end
end
