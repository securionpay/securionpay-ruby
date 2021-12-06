require_relative '../spec_helper'

describe SecurionPay::Tokens do
  include_context 'common'

  it 'create and retrieve token' do
    # given
    token_req = TestData.card

    # when
    token = SecurionPay::Tokens.create(token_req)
    retrieved = SecurionPay::Tokens.retrieve(token['id'])

    # then
    expect(retrieved['last4']).to eq(token_req['number'][-4, 4])
    expect(retrieved['first6']).to eq(token_req['number'][0, 6])
    expect(retrieved['expMonth']).to eq(token_req['expMonth'])
    expect(retrieved['expYear']).to eq('20' + token_req['expYear'])
    expect(retrieved['cardholderName']).to eq(token_req['cardholderName'])
    expect(retrieved['customerId']).to eq(token_req['customerId'])
    expect(retrieved['used']).to eq(false)
  end

end
