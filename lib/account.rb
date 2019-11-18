class Account

  attr_reader :name, :balance

  def initialize(name)
    @name = name
    @balance = 0
  end

  def credit(amount)
    @balance += amount
  end

  def debit(amount)
    @balance -= amount
  end

end
