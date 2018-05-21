require 'pry'

class Transfer

  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    end
  end

  def execute_transaction
    if !self.valid? || self.status == "complete"
      self.status == "rejected"
      return "Transaction rejected. Please check your account balance."
    else
      if self.valid? && self.status == "pending"
        self.status = "complete"
        negative_amount = -(@amount)
        @receiver.deposit(@amount)
        @sender.deposit(negative_amount)
      end
    end
  end

end
