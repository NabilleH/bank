# frozen_string_literal: true

class Statement

  HEADER = "date || credit || debit || balance\n"

  def print(history)
    entries = []
    history.each do |trans|
      entries.unshift("#{trans[:date]} ||#{credit_amount(trans[:type], trans[:amount])}||#{debit_amount(trans[:type], trans[:amount])}|| #{trans[:balance]}")
    end
    return HEADER + entries.join("\n")
  end

  private

  def credit_amount(type, amount)
    return " #{amount} " if type == 'credit'

    return ' '
  end

  def debit_amount(type, amount)
    return " #{amount} " if type == 'debit'

    return ' '
  end
end
