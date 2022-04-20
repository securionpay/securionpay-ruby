# frozen_string_literal: true

require_relative '../spec_helper'

describe SecurionPay::Events do
  include_context 'with test config'

  it 'retrieve event' do
    # given
    event, charge = create_event

    # when
    retrieved = SecurionPay::Events.retrieve(event['id'])

    # then
    expect(retrieved['data']['id']).to eq(charge['id'])
  end

  it 'list events' do
    # given
    event, = create_event

    # when
    events = SecurionPay::Events.list(limit: 100)

    # then
    expect(events['list'].map { |it| it['id'] })
      .to include(event['id'])
  end

  def create_event
    charge = SecurionPay::Charges.create(TestData.charge(card: TestData.fraud_warning_card))
    events = SecurionPay::Events.list(limit: 100)
    event = events['list'].find { |it| it['data']['id'] == charge['id'] }
    [event, charge]
  end
end
