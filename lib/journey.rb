class Journey

  attr_accessor :entry_station, :exit_station
  MIN_CHARGE = 1
  MAX_CHARGE = 6

  def initialize
    @entry_station
    @exit_station
    @min_fare = MIN_CHARGE
    @max_fare = MAX_CHARGE
  end

  def fare
    if @entry_station == nil || @exit_station == nil
      return @max_fare
    elsif @entry_station.zone != @exit_station.zone
      zone_diff = (@entry_station.zone - @exit_station.zone).to_i
      return (1 + zone_diff.abs)
    else
      return @min_fare
    end

  end

  def change_entry(entry_station)
    @entry_station = entry_station
  end

  def change_exit(exit_station)
    @exit_station = exit_station
  end

end
