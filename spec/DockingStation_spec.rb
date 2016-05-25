require 'DockingStation'
require 'bike'

describe DockingStation do

  it { should be_instance_of(DockingStation)}

  it { is_expected.to respond_to(:release_bike) }

  it { is_expected.to respond_to(:bikes) }

  it { is_expected.to respond_to(:dock).with(1).argument }

  it 'returns empty if no bike has been docked' do
    expect(subject.bikes).to eq([])
  end

  it 'returns the bike if bike has been docked' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes).to eq([bike])
  end

  it 'should not give out infinite bikes' do
    expect { subject.release_bike }.to raise_error("Bike not available")
  end

  it 'should not accept bike if full' do
    20.times { subject.dock(Bike.new) }
    expect { subject.dock(Bike.new) }.to raise_error("Dock is full")
  end

  it 'should return bike if one is docked' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq(bike)
  end

end
