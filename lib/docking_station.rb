require_relative "bike.rb"

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :docked
  attr_accessor :capacity

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

  def call_a_van
    van = Van.new(self, list_bad_bikes)
    release_broken_bikes(list_bad_bikes)
    van.deliver_broken_bikes
  end

  private

  def full?
    true if @docked.length == @capacity
  end

  def all_bikes_broken?
    unsuitable = true
    @docked.each { |bike|
      if bike.working?
        unsuitable = false
      end
    }
    unsuitable
  end

  def list_bad_bikes
    @docked.select { |bike|
      !bike.working?
    }
  end

  def release_broken_bikes(broken)
    broken.each do |bike|
      if @docked.delete(bike)
      end
    end
  end
end
