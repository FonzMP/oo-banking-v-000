class Transfer
  # your code here

  attr_accessor :sender, :receiver :status
  attr_reader :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

end
