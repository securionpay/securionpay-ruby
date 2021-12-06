require_relative '../spec_helper'

describe SecurionPay::FraudWarnings do
  include_context 'common'

  it 'retrieve fraud_warning' do
    # given
    fraud_warning, charge = create_fraud_warning

    # when
    retrieved = SecurionPay::FraudWarnings.retrieve(fraud_warning['id'])

    # then
    expect(retrieved['charge']).to eq(charge['id'])
  end

  it 'list fraud_warnings' do
    # given
    fraud_warning, _ = create_fraud_warning

    # when
    fraud_warnings = SecurionPay::FraudWarnings.list(limit: 100)

    # then
    expect(fraud_warnings['list'].map { |it| it['id'] })
      .to include(fraud_warning['id'])
  end
end

def create_fraud_warning
  charge = SecurionPay::Charges.create(TestData.charge(card: TestData.fraud_warning_card))
  WaitUtil.wait_for_condition("fraud_warning", :timeout_sec => 30) {
    fraud_status = SecurionPay::Charges.retrieve(charge['id'])
                     &.fetch('fraudDetails', nil)
                     &.fetch('status', nil)
    fraud_status != 'in_progress'
  }
  fraud_warnings = SecurionPay::FraudWarnings.list(limit: 100)
  fraud_warning = fraud_warnings['list'].find { |it| it['charge'] == charge['id'] }
  [fraud_warning, charge]
end