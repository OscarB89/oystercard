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

end
