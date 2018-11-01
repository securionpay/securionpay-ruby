module SecurionPay
  class Plans
    extend TransactionBase

    def self.create(params)
      communicator.post(
        path_builder.build_plans_path,
        params
      )
    end

    def self.retrieve(plan_id)
      communicator.get(
        path_builder.build_plans_path(plan_id)
      )
    end

    def self.update(plan_id, params)
      communicator.post(
        path_builder.build_plans_path(plan_id),
        params
      )
    end

    def self.delete(plan_id)
      communicator.delete(
        path_builder.build_plans_path(plan_id)
      )
    end

    def self.list
      communicator.get(
        path_builder.build_plans_path
      )
    end
  end
end
