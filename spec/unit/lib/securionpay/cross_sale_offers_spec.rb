require 'spec_helper'

describe SecurionPay::CrossSaleOffers do
  let(:cross_sale_offer_id) { double }
  let(:params) { double }
  let(:communicator) { double }
  let(:response) { double }
  let(:path) { double }

  subject do
    described_class
  end

  before do 
    subject.communicator = communicator
  end

  describe '.create' do
    let(:http_method) { :post }
    let(:method) { :create }

    let(:subject_send_with) { params }
    let(:communicator_with) { params }

    it_behaves_like 'call_communicator'
  end

  describe '.retrieve' do
    let(:http_method) { :get }
    let(:method) { :retrieve }

    let(:subject_send_with) { cross_sale_offer_id }
    let(:communicator_with) { nil }

    it_behaves_like 'call_communicator'
  end

  describe '.update' do
    let(:http_method) { :post }
    let(:method) { :update }

    let(:subject_send_with) { [cross_sale_offer_id, params] }
    let(:communicator_with) { params }

    it_behaves_like 'call_communicator'
  end

  describe '.delete' do
    let(:http_method) { :delete }
    let(:method) { :delete }

    let(:subject_send_with) { cross_sale_offer_id }
    let(:communicator_with) { nil }

    it_behaves_like 'call_communicator'
  end

  describe '.list' do
    let(:http_method) { :get }
    let(:method) { :list }

    let(:subject_send_with) { nil }
    let(:communicator_with) { nil }

    it_behaves_like 'call_communicator'
  end
end
