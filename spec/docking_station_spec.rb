require "docking_station.rb"

describe DockingStation do
  # it 'responds to release_bike' do
  #   expect(DockingStation).to respond_to :release_bike
  # end
  let(:bike) { double(Bike.new) }
  let(:pedalo) { Bike.new }

  it { should respond_to :release_bike }

  it "should return a working bike" do
    #mock a method from the bike collaborator
    allow(bike).to receive(:working?) { true }
    subject.dock(bike)
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it { should respond_to(:dock).with(1).argument }

  it { should respond_to :docked }

  it 'should store a bike that\'s been docked' do
    subject.dock(pedalo)

    expect(subject.docked).to include(pedalo)
  end

  it "should not return a bike if there are none available" do
    expect { subject.release_bike }.to raise_error(RuntimeError)
  end

  it "should allow second bike to be docked" do
    subject.dock(bike)

    expect { subject.dock(pedalo) }.not_to raise_error
  end

  it "should have capacity to dock 20 bikes" do
    expect { DockingStation::DEFAULT_CAPACITY.times { subject.dock(Bike.new) } }.not_to raise_error
  end

  it "should raise error if more than 20 bikes" do
    expect { (DockingStation::DEFAULT_CAPACITY + 1).times { subject.dock(Bike.new) } }.to raise_error(RuntimeError)
  end

  it "should raise error if no bikes available after bikes have been docked and then released" do
    2.times { subject.dock(Bike.new) }
    expect { 3.times { subject.release_bike } }.to raise_error(RuntimeError)
  end

  it "can set docking station capacity" do
    expect { DockingStation.new(30) }.not_to raise_error
  end

  it "can store more bikes than default capacity" do
    station = DockingStation.new(30)
    expect { (DockingStation::DEFAULT_CAPACITY + 1).times { station.dock(Bike.new) } }.not_to raise_error
  end

  it "can see if the bike being returned is broken" do
    allow(bike).to receive(:broken) { true }
    allow(bike).to receive(:working?).and_call_original
    bike.broken = true
    subject.dock(bike)

    expect(bike.working?).to be false
  end

  it "will not relase a broken bike" do
    bike.broken = true
    subject.dock(bike)
    expect { subject.release_bike }.to raise_error(RuntimeError)
  end

  it "accepts broken bikes" do
    bike.broken = true
    subject.dock(bike)
    expect(subject.docked).to include(bike)
  end
end
