module SecurionPay
  module TransactionBase
    def communicator
      @communicator ||= Communicator
    end

    def communicator=(value)
      @communicator = value
    end

    def path_builder
      @path_builder ||= Builders::PathBuilder
    end

    def path_builder=(value)
      @path_builder = value
    end
  end
end
