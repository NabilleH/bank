require './lib/account'

describe Account do
  subject(:nabille) { described_class.new("nabille") }

  describe "a new bank account can be opened" do
    it 'should have a name' do
      expect(nabille.name).to eq("nabille")
    end

    it "should open with a balance of zero" do
      expect(nabille.balance).to eq(0)
    end
  end

  describe "a deposit can be made" do
    it "should update the balance with the amount deposited" do
      nabille.deposit(1000)
      expect(nabille.balance).to eq(1000)
    end
  end
  
end
