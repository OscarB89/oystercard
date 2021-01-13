require "journey"

describe Journey do

   it 'initialize entry_station' do
     expect(subject).to respond_to :entry_station
   end

   it 'initialize entry_station' do
     expect(subject).to respond_to :exit_station
   end

   it 'respond to route' do
    expect(subject).to respond_to(:route).with(2).arguments
   end

   it 'should return the entry and exit station' do
    subject.route("Nunhead", "Ealing Broardway")
    expect(subject.updated_route).to eq subject.updated_route
   end

   describe '#in_journey?' do
     it "should initially no be in a journey" do
       expect(subject).not_to be_in_journey
     end
   end

   describe '#fare method' do
     it "should charge minimum fare" do
       expect(subject.fare).to eq 1
     end

     it "should charge a penalty fare" do
       subject.entry_station = nil
       subject.exit_station = nil 
       expect { subject.fare }.to raise_error "Penalty fare of 6 charged"
     end
   end

end
