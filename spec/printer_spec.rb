require './lib/printer'

describe Printer do
  let(:statement) do
    "test statement\n"
  end

  it "prints a statement to the screen" do
    expect { subject.print(statement) }.to output(statement).to_stdout
  end

end
