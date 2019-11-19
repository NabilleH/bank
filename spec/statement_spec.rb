# frozen_string_literal: true

require './lib/statement'

describe Statement do
  let(:history_credit) do
    [{ date: '01/01/2020', type: 'credit', amount: '1000.00', balance: '1000.00' }]
  end

  let(:history_debit) do
    [{ date: '02/01/2020', type: 'debit', amount: '500.00', balance: '500.00' }]
  end

  let(:history_multi) do
    [{ date: '01/01/2020', type: 'credit', amount: '1000.00', balance: '1000.00' },
     { date: '02/01/2020', type: 'debit', amount: '500.00', balance: '500.00' }]
  end

  describe 'printing a statement' do
    it 'should print a statement with one credit entry' do
      statement = "date || credit || debit || balance\n01/01/2020 || 1000.00 || || 1000.00"
      expect(subject.generate_statement(history_credit)).to eq(statement)
    end

    it 'should print a statement with one debit entry' do
      statement = "date || credit || debit || balance\n02/01/2020 || || 500.00 || 500.00"
      expect(subject.generate_statement(history_debit)).to eq(statement)
    end

    it 'should print a statement with two entries with the newest entry first' do
      statement = "date || credit || debit || balance\n02/01/2020 || || 500.00 || 500.00\n01/01/2020 || 1000.00 || || 1000.00"
      expect(subject.generate_statement(history_multi)).to eq(statement)
    end
  end
end
