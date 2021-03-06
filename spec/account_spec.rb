# frozen_string_literal: true

require './lib/account'

describe Account do
  subject(:nabille) { described_class.new('nabille', statement: statement) }
  let(:statement) { double(:statement, generate_statement: printed_statement) }
  let(:printed_statement) { "test statement\n" }

  describe 'a new bank account can be opened' do
    it 'should have a name' do
      expect(nabille.name).to eq('nabille')
    end

    it 'should open with a balance of zero' do
      expect(nabille.balance).to eq(0)
    end

    it 'should have a blank transaction history' do
      expect(nabille.history).to eq([])
    end
  end

  describe 'a deposit can be made' do
    it 'should update the balance with the amount deposited' do
      nabille.credit(1000)
      expect(nabille.balance).to eq(1000)
    end

    it 'should not update the balance with negative or zero deposits' do
      nabille.credit(-1000)
      nabille.credit(0)
      expect(nabille.balance).to eq(0)
    end

    it 'should update the account history after a credit with the date, type, amount and balance' do
      allow(nabille).to receive(:time_stamp).and_return('01/01/2020')
      nabille.credit(1000)
      expect(nabille.history.first).to eq(date: '01/01/2020', type: 'credit', amount: '1000.00', balance: '1000.00')
    end
  end

  describe 'a withdrawal can be made' do
    it 'should update the balance with the amount withdrawn' do
      nabille.credit(1000)
      nabille.debit(1000)
      expect(nabille.balance).to eq(0)
    end

    it 'should not update the balance with negative or zero withdrawals' do
      nabille.debit(-1000)
      nabille.debit(0)
      expect(nabille.balance).to eq(0)
    end

    it 'should update the account history after a debit with the date, type, amount and balance' do
      nabille.credit(1000)
      allow(nabille).to receive(:time_stamp).and_return('02/01/2020')
      nabille.debit(200)
      expect(nabille.history.last).to eq(date: '02/01/2020', type: 'debit', amount: '200.00', balance: '800.00')
    end
  end

  describe 'printing a statement' do
    it 'it prints a statement' do
      expect { subject.print_statement }.to output(printed_statement).to_stdout
    end
  end
end
