module SecurionPay
  module Builders
    class PathBuilder
      def self.build_card_path(customer_id, card_id = nil)
        if card_id
          "/customers/#{customer_id}/cards/#{card_id}"
        else
          "/customers/#{customer_id}/cards"
        end
      end

      def self.build_customers_path(customer_id = nil)
        if customer_id
          "/customers/#{customer_id}"
        else
          "/customers"
        end
      end

      def self.build_subscriptions_path(customer_id, subscription_id = nil)
        if subscription_id
          "/customers/#{customer_id}/subscriptions/#{subscription_id}"
        else
          "/customers/#{customer_id}/subscriptions"
        end
      end

      def self.build_blacklist_path(blacklist_rule_id = nil)
        if blacklist_rule_id
          "/blacklist/#{blacklist_rule_id}"
        else
          '/blacklist'.freeze
        end
      end

      def self.build_charges_path(charge_id = nil, sub_transaction = nil)
        if charge_id
          if sub_transaction
            "/charges/#{charge_id}/#{sub_transaction}"
          else
            "/charges/#{charge_id}"
          end
        else
          '/charges'.freeze
        end
      end

      def self.build_cross_sale_offers_path(cross_sale_offer_id = nil)
        if cross_sale_offer_id
          "/cross_sale_offers/#{cross_sale_offer_id}"
        else
          '/cross_sale_offers'.freeze
        end
      end

      def self.build_customer_records_path(customer_record_id = nil, customer_record_type = nil, customer_record_type_id = nil)

        if customer_record_id
          if customer_record_type
            if customer_record_type_id
              "/customer-records/#{customer_record_id}/#{customer_record_type}/#{customer_record_type_id}"
            else
              "/customer-records/#{customer_record_id}/#{customer_record_type}"
            end
          else
            "/customer-records/#{customer_record_id}"
          end
        else
          '/customer-records'.freeze
        end
      end
    end
  end
end
