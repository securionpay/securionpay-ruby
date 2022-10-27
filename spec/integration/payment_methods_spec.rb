# frozen_string_literal: true

require_relative '../spec_helper'

describe SecurionPay::PaymentMethods do
  include_context 'with test config'

  it 'create and retrieve payment_method' do
    # given
    payment_method_req = TestData.payment_method

    # when
    created = SecurionPay::PaymentMethods.create(payment_method_req)
    retrieved = SecurionPay::PaymentMethods.retrieve(created['id'])

    # then
    expect(retrieved['id']).to eq(created['id'])
    expect(retrieved['clientObjectId']).to eq(created['clientObjectId'])
    expect(retrieved['type']).to eq(payment_method_req['type'])
    expect(retrieved['billing']).to eq(payment_method_req['billing'])
    expect(retrieved['status']).to eq('chargeable')
    expect(retrieved['status']).to eq('chargeable')
  end

  it 'delete payment_method' do
    # given
    payment_method_req = TestData.payment_method
    created = SecurionPay::PaymentMethods.create(payment_method_req)

    # when
    SecurionPay::PaymentMethods.delete(created['id'])
    retrieved = SecurionPay::PaymentMethods.retrieve(created['id'])

    # then
    expect(retrieved['id']).to eq(created['id'])
    expect(retrieved['deleted']).to eq(true)
  end

  it 'list payment_methods' do
    # given
    customer = SecurionPay::Customers.create(TestData.customer)
    payment_method_req = TestData.payment_method(customer_id: customer['id'])
    payment_method1 = SecurionPay::PaymentMethods.create(payment_method_req)
    payment_method2 = SecurionPay::PaymentMethods.create(payment_method_req)
    payment_method3 = SecurionPay::PaymentMethods.create(payment_method_req)

    # when
    all_payment_methods = SecurionPay::PaymentMethods.list({ customerId: customer['id'] })
    payment_methods_after_last_id = SecurionPay::PaymentMethods.list(
      { customerId: customer['id'], startingAfterId: payment_method3['id'] }
    )

    # then
    expect(all_payment_methods['list'].map { |payment_method| payment_method['id'] })
      .to contain_exactly(payment_method1['id'], payment_method2['id'], payment_method3['id'])

    expect(payment_methods_after_last_id['list'].map { |payment_method| payment_method['id'] })
      .to contain_exactly(payment_method1['id'], payment_method2['id'])
  end
end
