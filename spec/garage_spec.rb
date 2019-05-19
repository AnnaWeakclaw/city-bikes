require "garage"
describe Garage do
  before(:each) {
    bikes = []
    @bike1 = Bike.new
    bike2 = Bike.new
    @station = DockingStation.new
    @bike1.broken = true
    bike2.broken = true
    bikes.push(@bike1).push(bike2)
    @garage = Garage.new(@station, bikes)
  }
  it "can fix bikes" do
    expect(@garage).to respond_to(:fix)
    expect(@garage.fix).to include(@bike1)
    # TODO: do you need to check how to use doubles here to check the bike collaborator is working?
    expect(@bike1.working?).to be true
  end
  it "can call a van" do
    # Garage has to fix bikes first
    @garage.fix
    # We don't want to test Van, just that the garage can put the bikes there
    expect(@garage.call_a_van).to include(@bike1)
  end

  it "can send the bikes back to the docking station" do
    # Garage has to fix bikes first
    @garage.fix
    @garage.call_a_van
    # TODO: If testing a garage can I make an expectation for the docking station?
    expect(@station.docked).to include(@bike1)
  end
end
