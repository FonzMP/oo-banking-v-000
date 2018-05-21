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
    counter = 0
    while counter < 1
      if self.valid?
        self.status = "complete"
        negative_amount = -(@amount)
        binding.pry
        @receiver.deposit(@amount)
        @sender.deposit(negative_amount)
        counter += 1
      end
    end
  end

end
