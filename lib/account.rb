require_relative 'statement'

class Account

  attr_reader :name, :balance, :history

  def initialize(name, statement: nil)
    @name = name
    @balance = 0
    @history = []
    @statement = statement || Statement.new
  end

  def print_statement
    statement = @statement.print(@history)
    puts statement
    statement
  end

  def credit(amount)
    return if amount <= 0
    @balance += amount
    update_history(type: 'credit', amount: amount)
  end

  def debit(amount)
    return if amount <= 0
    @balance -= amount
    update_history(type: 'debit', amount: amount)
  end

  private

  def update_history(type:, amount:)
    @history.push(date: time_stamp, type: type, amount: amount, balance: calc_balance(amount, type))
  end

  def time_stamp
    Time.now.strftime('%m/%d/%Y')
  end

  def calc_balance(amount, type)
    return amount if @history.empty?
    return @history.last[:balance] + amount if type == 'credit'
    return @history.last[:balance] - amount if type == 'debit'
  end
end
