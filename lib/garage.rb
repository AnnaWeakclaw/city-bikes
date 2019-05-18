class Garage
  def initialize(station, broken_bikes)
    @broken_bikes = broken_bikes
    @station = station
  end

  def fix
    @broken_bikes.each do |bike|
      bike.broken = false
    end
    #assignemnt for clarity - does it make sense?
    @fixed_bikes = @broken_bikes
  end

  def call_a_van
    van = Van.new(@station, @fixed_bikes)
    van.deliver_fixed_bikes(@station)
  end
end