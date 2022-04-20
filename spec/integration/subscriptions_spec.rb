# frozen_string_literal: true

require_relative '../spec_helper'

describe SecurionPay::Subscriptions do
  include_context 'with test config'

  it 'create and retrieve subscription' do
    # given
    plan = SecurionPay::Plans.create(TestData.plan)
    customer = SecurionPay::Customers.create(TestData.customer(card: TestData.card))

    # when
    subscription = SecurionPay::Subscriptions.create(customerId: customer['id'], planId: plan['id'])
    retrieved = SecurionPay::Subscriptions.retrieve(subscription['id'])

    # then
    expect(retrieved['id']).to eq(subscription['id'])
    expect(retrieved['planId']).to eq(plan['id'])
    expect(retrieved['customerId']).to eq(customer['id'])
  end

  it 'update subscription' do
    # given
    plan = SecurionPay::Plans.create(TestData.plan)
    customer = SecurionPay::Customers.create(TestData.customer(card: TestData.card))
    subscription = SecurionPay::Subscriptions.create(customerId: customer['id'], planId: plan['id'])
    # when
    SecurionPay::Subscriptions.update(subscription['id'],
                                      shipping: {
                                        name: 'Updated shipping',
                                        address: {
                                          "line1" => "Updated line1",
                                          "line2" => "Updated line2",
                                          "zip" => "Updated zip",
                                          "city" => "Updated city",
                                          "state" => "Updated state",
                                          "country" => "CH",
                                        }.compact,
                                      })
    retrieved = SecurionPay::Subscriptions.retrieve(subscription['id'])

    # then
    expect(subscription['shipping']).to be_nil
    expect(retrieved['id']).to eq(subscription['id'])
    expect(retrieved['planId']).to eq(plan['id'])

    shipping = retrieved['shipping']
    expect(shipping['name']).to eq('Updated shipping')
    expect(shipping['address']['line1']).to eq("Updated line1")
    expect(shipping['address']['line2']).to eq("Updated line2")
    expect(shipping['address']['zip']).to eq("Updated zip")
    expect(shipping['address']['city']).to eq("Updated city")
    expect(shipping['address']['state']).to eq("Updated state")
    expect(shipping['address']['country']).to eq("CH")
  end

  it 'cancel subscription' do
    # given
    plan = SecurionPay::Plans.create(TestData.plan)
    customer = SecurionPay::Customers.create(TestData.customer(card: TestData.card))
    subscription = SecurionPay::Subscriptions.create(customerId: customer['id'], planId: plan['id'])

    # when
    SecurionPay::Subscriptions.cancel(subscription['id'])
    canceled = SecurionPay::Subscriptions.retrieve(subscription['id'])

    # then
    expect(subscription['status']).to eq('active')
    expect(canceled['status']).to eq('canceled')
    expect(canceled['canceledAt']).not_to be_nil
  end

  it 'list subscription' do
    # given
    plan = SecurionPay::Plans.create(TestData.plan)
    customer = SecurionPay::Customers.create(TestData.customer(card: TestData.card))
    subscription1 = SecurionPay::Subscriptions.create(customerId: customer['id'], planId: plan['id'])
    subscription2 = SecurionPay::Subscriptions.create(customerId: customer['id'], planId: plan['id'])
    canceled_subscription = SecurionPay::Subscriptions.create(customerId: customer['id'], planId: plan['id'])
    SecurionPay::Subscriptions.cancel(canceled_subscription['id'])

    # when
    all = SecurionPay::Subscriptions.list(customerId: customer['id'])
    deleted = SecurionPay::Subscriptions.list(customerId: customer['id'], deleted: true)

    # then
    expect(all['list'].map { |it| it['id'] })
      .to contain_exactly(subscription1['id'], subscription2['id'])
    expect(deleted['list'].map { |it| it['id'] })
      .to contain_exactly(canceled_subscription['id'])
  end
end
