class Journey
  attr_reader :entry_station, :exit_station, :updated_route

  def initialize
    @entry_station
    @exit_station
    @updated_route = { entry_station: entry_station, exit_station: exit_station }
  end

  def in_journey?
    !!@entry_station
  end

  def route(entry_station, exit_station)
    @entry_station = entry_station
    @exit_station = exit_station
    @updated_route
  end

 def fare
   fail "Penalty fare of 6 charged" if @entry_station = nil || @exit_station = nil
   
   1
 end



end
