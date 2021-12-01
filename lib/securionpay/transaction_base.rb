module SecurionPay
  module TransactionBase
    def communicator
      @communicator ||= Communicator
    end

    def communicator=(value)
      @communicator = value
    end
  end
end
