require 'docking_station'

describe DockingStation do
	it {is_expected.to respond_to :release_bike}
	it "returns bike & bike is working" do
		bike = subject.release_bike
		expect(bike.working?).to eq true
	end
	it { is_expected.to respond_to(:dock).with(1).argument }
	it { is_expected.to respond_to(:has_bikes?)}

	it "#has_bikes? returns true if more than 0 bikes are docked" do
    subject.dock(Bike.new)
    expect(subject.has_bikes?).to eq true
	end

	it "#has_bikes? returns false if 0 bikes are docked" do
    expect(subject.has_bikes?).to eq false
	end

  it '#dock raises an error if empty array is passed to it' do
    expect{subject.dock([])}.to raise_error('No bikes in the input array')
  end

  context 'when no bike is docked' do
    before(:each) {@d = DockingStation.new}

    it "#release_bike returns an error." do
      expect {@d.release_bike}.to raise_error("No bikes available.")
    end

    it "#docked_bikes is an empty array." do
      expect(@d.docked_bikes).to eq([])
    end
     
    it "#dock accepts an array of bikes" do
      expect{@d.dock([Bike.new, Bike.new])}.not_to raise_error(Exception) 
    end 

  end

  context 'when dock is full' do
    d = DockingStation.new
    20.times{d.dock([Bike.new])}
    it '#dock raises an error' do
      expect {d.dock([Bike.new])}.to raise_error("Station full.")
    end
  end

  context 'when new dock is created' do
      d = DockingStation.new
      it '#docked_bikes contains empty array' do
        expect(d.docked_bikes).to eq([])
      end
      it '#dock raises error if passed bikes exceed capacity' do
        expect{d.dock(Array.new(d.capacity + 1, Bike.new))}.to raise_error('Not enough capacity in dock to accommodate bikes in array')
      end
  end
end
