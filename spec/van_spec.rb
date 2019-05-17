require 'van'

describe Van do

  it "can take broken bikes from docking station and deliver broken bikes to the garage" do
    bikes = []
    bike1 = double (Bike.new)
    bike2 = double (Bike.new)
    bikes.push(bike1).push(bike2)
    van = Van.new(bikes)
    expect(van).to respond_to(:deliver_broken_bikes)
    expect(van.deliver_broken_bikes).to be_an_instance_of(Garage)
  end

end