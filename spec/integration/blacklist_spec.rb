require_relative '../spec_helper'

describe SecurionPay::Blacklist do
  include_context 'common'

  it 'create and retrieve blacklist' do
    # given
    email = random_email
    # when
    created = SecurionPay::Blacklist.create({ ruleType: 'email', email: email, })
    retrieved = SecurionPay::Blacklist.retrieve(created['id'])

    # then
    expect(retrieved['ruleType']).to eq('email')
    expect(retrieved['email']).to eq(email)
  end

  it 'delete blacklist' do
    # given
    email = random_email
    # given
    created = SecurionPay::Blacklist.create({ ruleType: 'email', email: email, })

    # when
    SecurionPay::Blacklist.delete(created['id'])
    deleted = SecurionPay::Blacklist.retrieve(created['id'])

    # then
    expect(deleted['ruleType']).to eq('email')
    expect(deleted['email']).to eq(email)
    expect(deleted['deleted']).to eq(true)
  end

  it 'list blacklist' do
    # given
    created1 = SecurionPay::Blacklist.create({ ruleType: 'email', email: random_email })
    created2 = SecurionPay::Blacklist.create({ ruleType: 'email', email: random_email })
    deleted = SecurionPay::Blacklist.create({ ruleType: 'email', email: random_email })
    SecurionPay::Blacklist.delete(deleted['id'])

    # when
    all_default = SecurionPay::Blacklist.list(limit: 100)
    all_with_deleted = SecurionPay::Blacklist.list(deleted: true, limit: 100)

    # then
    expect(all_default['list'].map { |it| it['id'] }).
      to include(created1['id'], created2['id']).
        and not_include(deleted['id'])
    expect(all_with_deleted['list'].map { |it| it['id'] }).
      to include(deleted['id']).
        and not_include(created1['id'], created2['id'])

  end
end
