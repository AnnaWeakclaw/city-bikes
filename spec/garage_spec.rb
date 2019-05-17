require 'garage'
describe Garage do
  it "can fix bikes" do
    #TODO refactor this block and still get a hold of bike1
    bikes = []
    bike1 = Bike.new
    bike2 = Bike.new
    bike1.broken = true
    bike2.broken = true
    bikes.push(bike1).push(bike2)
    garage = Garage.new(bikes)
    expect(garage).to respond_to(:fix)
    expect(garage.fix).to include(bike1)
    #TODO: do you need to check how to use doubles here to check the bike collaborator is working?
    expect(bike1.working?).to be true
  end

  it "can call a van" do 
    bikes = []
    bike1 = Bike.new
    bike2 = Bike.new
    bike1.broken = true
    bike2.broken = true
    bikes.push(bike1).push(bike2)
    garage = Garage.new(bikes)
    expect(garage.call_a_van).to be_a_kind_of(DockingStation)
  end
end