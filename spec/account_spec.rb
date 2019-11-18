require './lib/account'

describe Account do

  describe "a new bank account can be opened" do
    it 'should have a name' do
      nabille = Account.new("nabille")
      expect(nabille.name).to eq("nabille")
    end
  end

end
