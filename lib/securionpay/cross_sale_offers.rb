# frozen_string_literal: true

module SecurionPay
  class CrossSaleOffers
    extend TransactionBase

    def self.create(params)
      communicator.post("#{Configuration.service_url}/cross-sale-offers", json: params)
    end

    def self.retrieve(cross_sale_offer_id)
      communicator.get("#{Configuration.service_url}/cross-sale-offers/#{cross_sale_offer_id}")
    end

    def self.update(cross_sale_offer_id, params)
      communicator.post("#{Configuration.service_url}/cross-sale-offers/#{cross_sale_offer_id}", json: params)
    end

    def self.delete(cross_sale_offer_id)
      communicator.delete("#{Configuration.service_url}/cross-sale-offers/#{cross_sale_offer_id}")
    end

    def self.list(params = nil)
      communicator.get("#{Configuration.service_url}/cross-sale-offers", query: params)
    end
  end
end
