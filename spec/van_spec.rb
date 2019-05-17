require 'van'

describe Van do

  let(:van) {
    bikes = []
    bike1 = double (Bike.new)
    bike2 = double (Bike.new)
    bikes.push(bike1).push(bike2)
    Van.new(bikes)
  }
  it "can take broken bikes from docking station and deliver broken bikes to the garage" do
    expect(van).to respond_to(:deliver_broken_bikes)
    expect(van.deliver_broken_bikes).to be_an_instance_of(Garage)
  end

  it "can take fixed bikes from garage and return them to docking station" do
    expect(van).to respond_to(:deliver_fixed_bikes)
    expect(van.deliver_fixed_bikes).to be_an_instance_of(DockingStation)
  end
end