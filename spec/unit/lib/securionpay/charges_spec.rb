require 'spec_helper'

describe SecurionPay::Charges do
  let(:customer_id) { 'some_customer_id' }
  let(:charge_id) { 'some_charge_id' }
  let(:params) { double }
  let(:communicator) { double }
  let(:path_builder) { double }
  let(:response) { double }
  let(:path) { double }
  let(:sub_transaction) { nil }
  let(:path_builder_receive) { :build_charges_path }
  let(:path_builder_with) { [customer_id, card_id] }
  let(:subject_send_with) { [customer_id, card_id] }
  let(:communicator_with) { nil }

  subject do
    described_class
  end

  before do 
    subject.communicator = communicator
    subject.path_builder = path_builder
  end

  describe '.create' do
    let(:http_method) { :post }
    let(:method) { :create }
    let(:path_builder_with) { nil }
    let(:subject_send_with) { params }
    let(:communicator_with) { params }
    it_behaves_like 'call_communicator'
  end

  describe '.retrieve' do
    let(:http_method) { :get }
    let(:method) { :retrieve }
    let(:path_builder_with) { charge_id }
    let(:subject_send_with) { charge_id }
    let(:communicator_with) { nil }
    it_behaves_like 'call_communicator'
  end

  describe '.update' do
    let(:http_method) { :post }
    let(:method) { :update }
    let(:path_builder_with) { charge_id }
    let(:subject_send_with) { [charge_id, params] }
    let(:communicator_with) { params }
    it_behaves_like 'call_communicator'
  end

  describe '.list' do
    let(:http_method) { :get }
    let(:method) { :list }
    let(:path_builder_with) { nil }
    let(:subject_send_with) { nil }
    let(:communicator_with) { nil }
    it_behaves_like 'call_communicator'
  end

  describe '.capture' do
    let(:http_method) { :post }
    let(:method) { :capture }
    let(:path_builder_with) { [charge_id, :capture] }
    let(:subject_send_with) { charge_id }
    let(:communicator_with) { nil }
    it_behaves_like 'call_communicator'
  end

  describe '.refund' do
    let(:http_method) { :post }
    let(:method) { :refund }
    let(:path_builder_with) { [charge_id, :refund] }
    let(:subject_send_with) { [charge_id, params] }
    let(:communicator_with) { params }
    it_behaves_like 'call_communicator'

    context 'params is nil' do
      let(:http_method) { :post }
      let(:method) { :refund }
      let(:path_builder_with) { [charge_id, :refund] }
      let(:subject_send_with) { charge_id }
      let(:communicator_with) { [ nil ] }
      it_behaves_like 'call_communicator'
    end
  end
end
