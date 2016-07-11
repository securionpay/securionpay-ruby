module SecurionPay
  class CrossSaleOffers
    extend TransactionBase

    def self.create(params)
      communicator.post(
        path_builder.build_cross_sale_offers_path,
        params
      )
    end

    def self.retrieve(cross_sale_offer_id)
      communicator.get(
        path_builder.build_cross_sale_offers_path(cross_sale_offer_id)
      )
    end

    def self.update(cross_sale_offer_id, params)
      communicator.post(
        path_builder.build_cross_sale_offers_path(cross_sale_offer_id),
        params
      )
    end

    def self.delete(cross_sale_offer_id)
      communicator.delete(
        path_builder.build_cross_sale_offers_path(cross_sale_offer_id)
      )
    end

    def self.list
      communicator.get(
        path_builder.build_cross_sale_offers_path
      )
    end
  end
end
