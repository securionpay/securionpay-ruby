require 'spec_helper'

describe SecurionPay::Blacklist do
  let(:blacklist_rule_id) { 'some_blacklist_rule_id' }
  let(:params) { { foo: :bar } }
  let(:communicator) { double }
  let(:response) { double }
  let(:path) { double }
  let(:subject_send_with) { blacklist_rule_id }
  let(:communicator_with) { nil }
  let(:http_method) { :post }

  subject do
    described_class
  end

  before do 
    subject.communicator = communicator
  end

  describe '.create' do
    let(:method) { :create }
    let(:communicator_with) { params }
    let(:subject_send_with) { params }
    it_behaves_like 'call_communicator'
  end

  describe '.retrieve' do
    let(:http_method) { :get }
    let(:method) { :retrieve }
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
    let(:subject_send_with) { nil }
    it_behaves_like 'call_communicator'
  end
end
