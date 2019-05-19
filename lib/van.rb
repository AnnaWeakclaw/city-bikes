require_relative "garage.rb"

class Van
  def initialize(station, broken_or_fixed_bikes)
    @broken_or_fixed_bikes = broken_or_fixed_bikes
    @station = station
  end

  def deliver_broken_bikes
    Garage.new(@station, @broken_or_fixed_bikes)
  end

  def deliver_fixed_bikes(station)
    # Returns the bikes to the existing docking station
    @broken_or_fixed_bikes.each do |fine_bike|
      @station.dock(fine_bike)
    end
  end
end
