require 'spec_helper'

describe SecurionPay::Customers do
  let(:customer_id) { 'some_customer_id' }
  let(:params) { double }
  let(:communicator) { double }
  let(:path_builder) { double }

  let(:response) { double }
  let(:path) { double }
  let(:path_builder_receive) { :build_customers_path }
  let(:path_builder_with) { customer_id }
  let(:subject_send_with) { customer_id }
  let(:communicator_with) { params }

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
    let(:subject_send_with) { params }
    let(:path_builder_with) { nil }
    it_behaves_like 'call_communicator'
  end

  describe '.retrieve' do
    let(:http_method) { :get }
    let(:method) { :retrieve }
    let(:communicator_with) { nil }
    it_behaves_like 'call_communicator'
  end

  describe '.update' do
    let(:http_method) { :post }
    let(:method) { :update }
    let(:subject_send_with) { [customer_id, params] }
    it_behaves_like 'call_communicator'
  end

  describe '.delete' do
    let(:http_method) { :delete }
    let(:method) { :delete }
    let(:path_builder_with) { customer_id }
    let(:subject_send_with) { customer_id }
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
end
