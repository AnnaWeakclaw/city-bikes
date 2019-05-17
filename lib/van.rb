require 'garage.rb'

class Van
  def initialize(broken_bikes)
    @broken_bikes = broken_bikes
  end

  def deliver_broken_bikes
    Garage.new(@broken_bikes)
  end
end