require_relative "bike.rb"

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :docked

  def initialize(capacity = DEFAULT_CAPACITY)
    @docked = []
    @capacity = capacity
  end

  def release_bike
    if @docked.empty? || all_bikes_broken?
      raise { RuntimeError.new }
    else
      #I want to give a customer a working bike and make sure that my @docked still have
      #correct bikes inside
      good_bikes = @docked.select { |bike|
        bike.working?
      }
      bad_bikes = list_bad_bikes
      
      fine_bike = good_bikes.shift
    end
    @docked = good_bikes + bad_bikes
    return fine_bike
  end

  def dock(bike)
    full? ? raise { RuntimeError.new } : @docked.push(bike)
  end

  private

  def full?
    true if @docked.length == @capacity
  end

  def all_bikes_broken?
    unsuitable = false
    @docked.each { |bike|
      if !bike.working?
        unsuitable = true
      end
    }
    true if unsuitable
  end

  def list_bad_bikes
    @docked.select { |bike|
      !bike.working?
    }
  end

  def call_a_van
    Van.new(list_bad_bikes)
  end
end
