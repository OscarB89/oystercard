require "journey"

describe Journey do

let(:journey) { Journey.new("Nunhead") }

   it 'should return an entry station' do
     expect(journey.entry_station).to eq "Nunhead"
   end

   it 'should return an exit station' do
      journey.exit_station = 'Peckham Rye'
      expect(journey.exit_station).to eq "Peckham Rye"
   end

   describe '#fare method' do

  #  let(:journey_1) { Journey.new("Nunhead") }

     it "should charge minimum fare" do
      journey.exit_station = "Peckham Rye"
      expect(journey.fare).to eq Journey::MINIMUM_FARE
     end

     it "should charge a penalty fare if not touching out" do
      journey.exit_station = "Penalty"
      expect(journey.fare).to eq Journey::PENALTY_FARE
     end
   end

end
