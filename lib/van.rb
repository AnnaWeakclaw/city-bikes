require_relative 'garage.rb'

class Van
  def initialize(broken_or_fixed_bikes)
    @broken_or_fixed_bikes = broken_or_fixed_bikes
  end

  def deliver_broken_bikes
    Garage.new(@broken_or_fixed_bikes)
  end

  def deliver_fixed_bikes
    #TODO: How to return them to the existing docking station
    DockingStation.new(@broken_or_fixed_bikes)
  end

end