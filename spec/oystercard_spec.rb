require 'oystercard'

describe Oystercard do

  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }


    it 'can top up the balance' do
      expect{ subject.top_up 5 }.to change{ subject.balance }.by 5
    end

    it 'raises an error when maximum balance is exceeded' do
      max = Oystercard::MAX_BALANCE
      subject.top_up(max)
      expect{ subject.top_up(1) }.to raise_error "Cannot top up by £#{1}. Balance already at £#{max}"
    end
  end

  it 'deducts an amount from the balance' do
   subject.top_up(20)
   expect{ subject.deduct 7 }.to change{ subject.balance }.by -7
  end

  it 'is initially not in a journey' do
    expect(subject).not_to be_in_journey
  end


  it "can touch out" do
    subject.top_up(20)
    subject.touch_in
    subject.touch_out
    expect(subject).not_to be_in_journey
  end


  it "can touch in" do
    subject.top_up(20)
    subject.touch_in
    expect(subject).to be_in_journey
  end

  context 'No credit on card' do
    it 'will not touch in if below minimum balance' do
      expect{ subject.touch_in }.to raise_error "Insufficient funds for journey"
    end
  end
end
