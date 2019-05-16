require 'bike.rb'

describe Bike do
  it { should respond_to :working? }
  it "can be broken" do
    bike = Bike.new
    bike.broken = true
    expect(bike.working?).to be false
  end
end
