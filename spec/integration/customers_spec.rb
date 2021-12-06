require_relative '../spec_helper'

describe SecurionPay::Customers do
  include_context 'common'

  it 'create and retrieve customer' do
    # given
    customer_req = TestData.customer

    # when
    created = SecurionPay::Customers.create(customer_req)
    retrieved = SecurionPay::Customers.retrieve(created['id'])

    # then
    expect(retrieved['id']).to_not be_nil
    expect(retrieved['email']).to eq(customer_req['email'])
  end

  it 'update customer default card' do
    # given
    customer_req = TestData.customer(card: TestData.card)
    customer = SecurionPay::Customers.create(customer_req)

    # when
    new_card = SecurionPay::Cards.create(customer['id'], TestData.card)
    SecurionPay::Customers.update(customer['id'], { defaultCardId: new_card['id'] })
    updated = SecurionPay::Customers.retrieve(customer['id'])

    # then
    expect(updated['id']).to_not be_nil
    expect(updated['defaultCardId']).to eq(new_card['id'])
  end

  it 'delete customer' do
    # given
    customer_req = TestData.customer(card: TestData.card)
    customer = SecurionPay::Customers.create(customer_req)

    # when
    SecurionPay::Customers.delete(customer['id'])
    updated = SecurionPay::Customers.retrieve(customer['id'])

    # then
    expect(updated['id']).to_not be_nil
    expect(updated['deleted']).to eq(true)
  end

  it 'list customers' do
    # given
    email = random_email
    customer1 = SecurionPay::Customers.create(TestData.customer(email: email))
    customer2 = SecurionPay::Customers.create(TestData.customer(email: email))
    deleted_customer = SecurionPay::Customers.create(TestData.customer(email: email))
    SecurionPay::Customers.delete(deleted_customer['id'])

    # when
    all = SecurionPay::Customers.list(email: email)
    deleted = SecurionPay::Customers.list(email: email, deleted: true)

    # then
    expect(all['list'].map { |it| it['id'] })
      .to contain_exactly(customer1['id'], customer2['id'])
    expect(deleted['list'].map { |it| it['id'] })
      .to contain_exactly(deleted_customer['id'])
  end
end
