class Journey
  attr_reader :entry_station, :exit_station, :updated_route

  def initialize
    @entry_station
    @exit_station
    @updated_route = { entry_station: entry_station, exit_station: exit_station }
  end 

  def route(entry_station, exit_station)
    @entry_station = entry_station
    @exit_station = exit_station
    @updated_route
  end

end
