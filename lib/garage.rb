class Garage
  def initialize(broken_bikes)
    @broken_bikes = broken_bikes
  end

  def fix
    @broken_bikes.each do |bike|
      bike.broken = false
    end
    #assignemnt for clarity - does it make sense?
    @fixed_bikes = @broken_bikes
  end

  def call_a_van
    van = Van.new(@fixed_bikes)
    van.deliver_fixed_bikes
  end
end