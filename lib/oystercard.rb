require_relative 'Journey'

class Oystercard
  attr_reader :balance, :entry_station, :journeys, :exit_station

  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_FARE = 1
  DEFAULT_BALANCE = 0

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @journeys = []
    # @entry_station = entry_station
    # @exit_station = nil
    @journey = nil
    # { entry_station: @entry_station, exit_station: @exit_station }
  end

  def top_up(added)
    fail "Cannot top up by £#{added}. Balance already at £#{@balance}" if @balance + added > MAX_BALANCE
    @balance += added
  end

  def in_journey?
    !!@journey #true
    # @entry_station == nil ? false : true
  end

  def touch_in(entry_station)
    # @journey = Journey.new("Nunhead")
    if in_journey?
      @journey.exit_station = "Penalty"
      @journey = nil
    end
    fail "Insufficient funds for journey" if @balance < MIN_BALANCE
    # @entry_station = entry_station
    @journey = Journey.new(entry_station)
    in_journey?
  end

  def touch_out(exit_station)
    # deduct(MIN_FARE)
    # @exit_station = exit_station
    # @journey[:exit_station] = @exit_station
    # @entry_station = nil
    @journey = Journey.new("Penalty") unless in_journey?
    @journey.exit_station = exit_station
    @journeys << @journey
    deduct(@journey.fare)
    @journey = nil
    in_journey?
  end

  private

  def deduct(minus)
    @balance -= minus
  end

end

# array_1 = []
# array_to_hash = []
# array_1 << :mile_end
# array_1 << :ealing
# p array_to_hash << array_1
# p array_to_hash.to_h
# hash = {}
# hash.merge!(array_to_hash.to_h)
# p hash
