require 'spec_helper'

describe SecurionPay::CustomerRecords do
  let(:customer_record_id) { double }
  let(:customer_record_fee_id) { double }
  let(:customer_record_profit_id) { double }
  let(:params) { double }
  let(:communicator) { double }
  let(:path_builder) { double }
  let(:response) { double }
  let(:path) { double }
  let(:path_builder_receive) { :build_customer_records_path }

  subject do
    described_class
  end

  before do 
    subject.communicator = communicator
    subject.path_builder = path_builder
  end

  describe '.create' do
    let(:http_method) { :post }
    let(:method) { :buy }

    let(:path_builder_with) { nil }
    let(:subject_send_with) { params }
    let(:communicator_with) { params }

    it_behaves_like 'call_communicator'
  end

  describe '.refresh' do
    it 'gets refresh without params' do
      expect(path_builder).to receive(:build_customer_records_path).with(customer_record_id).and_return(path)
      expect(communicator).to receive(:post).with(path, nil).and_return(response)

      subject.refresh(customer_record_id)
    end
    
    it 'gets refresh with params' do
      expect(path_builder).to receive(:build_customer_records_path).with(customer_record_id).and_return(path)
      expect(communicator).to receive(:post).with(path, params).and_return(response)

      subject.refresh(customer_record_id, params)
    end
  end

  describe '.retrieve' do
    let(:http_method) { :get }
    let(:method) { :retrieve }

    let(:path_builder_with) { customer_record_id }
    let(:subject_send_with) { customer_record_id }
    let(:communicator_with) { nil }

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

  describe '.get_fee' do
    let(:http_method) { :get }
    let(:method) { :get_fee }

    let(:path_builder_with) { [customer_record_id, :fees, customer_record_fee_id] }
    let(:subject_send_with) { [customer_record_id, customer_record_fee_id] }
    let(:communicator_with) { nil }

    it_behaves_like 'call_communicator'
  end

  describe '.list_fees' do
    let(:http_method) { :get }
    let(:method) { :list_fees }

    let(:path_builder_with) { [customer_record_id, :fees] }
    let(:subject_send_with) { customer_record_id }
    let(:communicator_with) { nil }

    it_behaves_like 'call_communicator'
  end

  describe '.get_profit' do
    let(:http_method) { :get }
    let(:method) { :get_profit }

    let(:path_builder_with) { [customer_record_id, :profits, customer_record_profit_id] }
    let(:subject_send_with) { [customer_record_id, customer_record_profit_id] }
    let(:communicator_with) { nil }

    it_behaves_like 'call_communicator'
  end

  describe '.list_profits' do
    let(:http_method) { :get }
    let(:method) { :list_profits }

    let(:path_builder_with) { [customer_record_id, :profits] }
    let(:subject_send_with) { customer_record_id }
    let(:communicator_with) { nil }

    it_behaves_like 'call_communicator'
  end
end
