module SecurionPay
  # Blacklist can be used to block unwanted charges.
  class Blacklist
    extend TransactionBase

    def self.create(params)
      communicator.post(
        path_builder.build_blacklist_path,
        params
      )
    end

    def self.retrieve(blacklist_rule_id)
      communicator.get(
        path_builder.build_blacklist_path(blacklist_rule_id)
      )
    end

    def self.delete(blacklist_rule_id)
      communicator.delete(
        path_builder.build_blacklist_path(blacklist_rule_id)
      )
    end

    def self.list
      communicator.get(
        path_builder.build_blacklist_path
      )
    end
  end
end
