class Transfer

  attr_reader :sender, :receiver, :amount, :status

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
    if self.valid?
      @status = "complete"
      negative_amount = -(@amount)
      @receiver.deposit(@amount)
      @sender.deposit(negative_amount)
    end
  end

end
