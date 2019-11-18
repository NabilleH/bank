require './lib/account'

describe Account do
  subject(:nabille) { described_class.new("nabille") }
  # let(:history) { double(:history, balances: balances, credits: credits, debits: debits ) }
  # let(:balances) { "14/01/2012 "}

  describe "a new bank account can be opened" do
    it 'should have a name' do
      expect(nabille.name).to eq("nabille")
    end

    it "should open with a balance of zero" do
      expect(nabille.balance).to eq(0)
    end

    it "should have a blank transaction history" do
      expect(nabille.history).to eq([])
    end

  end

  describe "a deposit can be made" do
    it "should update the balance with the amount deposited" do
      nabille.credit(1000)
      expect(nabille.balance).to eq(1000)
    end

    it "should update the account history after a credit with the date, type, amount and balance" do
      nabille.credit(1000)
      expect(nabille.history.first).to eq(date: "01/01/2020", type: "credit", amount: 1000, balance: 1000 )
    end
  end

  describe "a withdrawal can be made" do
    it "should update the balance with the amount withdrawn" do
      nabille.credit(1000)
      nabille.debit(1000)
      expect(nabille.balance).to eq(0)
    end

    it "should update the account history after a debit with the date, type, amount and balance" do
      nabille.debit(1000)
      allow(nabille).to receive(:time_stamp).and_return("01/01/2020")
      expect(nabille.history.first).to eq(date: "01/01/2020", type: "debit", amount: 200, balance: 800 )
    end
  end

end
