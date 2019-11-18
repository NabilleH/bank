require './lib/account'

describe Account do

  describe "a new bank account can be opened" do
    it 'should have a name' do
      nabille = Account.new("nabille")
      expect(nabille.name).to eq("nabille")
    end

    it "should open with a balance of zero" do
      nabille = Account.new("nabille")
      expect(nabille.balance).to eq(0)
    end
  end

end
