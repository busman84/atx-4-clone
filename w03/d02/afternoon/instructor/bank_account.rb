class BankAccount

  attr_accessor :owner, :balance

  def initialize(owner)
    @owner = owner
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
    self
  end

  def withdraw(amount)
    if amount <= balance
      @balance -= amount
    end
    self
  end

end
