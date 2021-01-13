require 'station'

describe Station do

  #subject {described_class.new(name: "Old Street", zone: 1)}

  it "initialise a name variable" do
    expect(subject.name).to eq nil
  end

  it 'initialise a zone variable' do
    expect(subject.zone).to eq nil
  end

end
