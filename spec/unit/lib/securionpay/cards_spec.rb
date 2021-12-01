require 'spec_helper'

describe SecurionPay::Cards do
  let(:customer_id) { 'some_customer_id' }
  let(:card_id) { 'some_card_id' }
  let(:params) { double }
  let(:communicator) { double }
  let(:response) { double }
  let(:path) { double }
  let(:subject_send_with) { [customer_id, card_id] }
  let(:communicator_with) { nil }

  subject do
    described_class
  end

  before do 
    subject.communicator = communicator
  end

  describe '.create' do
    let(:http_method) { :post }
    let(:method) { :create }
    let(:communicator_with) { params }
    let(:subject_send_with) { [customer_id, params] }
    it_behaves_like 'call_communicator'
  end

  describe '.retrieve' do
    let(:http_method) { :get }
    let(:method) { :retrieve }
    it_behaves_like 'call_communicator'
  end

  describe '.update' do
    let(:http_method) { :post }
    let(:method) { :update }
    let(:communicator_with) { params }
    let(:subject_send_with) { [customer_id, card_id, params] }
    it_behaves_like 'call_communicator'
  end

  describe '.delete' do
    let(:http_method) { :delete }
    let(:method) { :delete }
    it_behaves_like 'call_communicator'
  end

  describe '.list' do
    let(:http_method) { :get }
    let(:method) { :list }
    let(:subject_send_with) { customer_id }
    it_behaves_like 'call_communicator'
  end
end
