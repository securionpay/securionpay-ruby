# frozen_string_literal: true

module SecurionPay
  class CrossSaleOffers
    extend TransactionBase

    def self.create(params)
      communicator.post("/cross-sale-offers", params)
    end

    def self.retrieve(cross_sale_offer_id)
      communicator.get("/cross-sale-offers/#{cross_sale_offer_id}")
    end

    def self.update(cross_sale_offer_id, params)
      communicator.post("/cross-sale-offers/#{cross_sale_offer_id}", params)
    end

    def self.delete(cross_sale_offer_id)
      communicator.delete("/cross-sale-offers/#{cross_sale_offer_id}")
    end

    def self.list(params = nil)
      communicator.get("/cross-sale-offers", params)
    end
  end
end
