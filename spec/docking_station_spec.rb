require 'docking_station'

describe DockingStation do

  describe 'Initialization' do

    it 'responds to ::new with either 1 or 0 arguments' do
      expect(DockingStation).to respond_to(:new).with(1).argument
      expect(DockingStation).to respond_to(:new).with(0).argument
    end

    it 'sets capacity to default if no argument given' do

    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end


  end

  context 'In any context' do
    it {is_expected.to respond_to :release_bike}

    it { is_expected.to respond_to(:dock).with(1).argument }

    it { is_expected.to respond_to(:has_bikes?)}

    it '#dock raises an error if empty array is passed to it' do
      expect{subject.dock([])}.to raise_error('No bikes in the input array')
    end

    it '#dock raises error if input array of bikes exceeds capacity' do
        expect{subject.dock(Array.new(DockingStation::DEFAULT_CAPACITY + 1, double(:bike)))}.to raise_error('Not enough capacity in dock to accommodate bikes in array')
      end
  end

  context 'When dock is empty' do
    before(:each) {@d = DockingStation.new}

    it '#has_bikes? returns false' do
      expect(subject.has_bikes?).to eq false
    end

    it '#release_bike raises an error.' do
      expect {@d.release_bike}.to raise_error("No bikes available.")
    end

    it '#docked_bikes returns an empty array.' do
      expect(@d.docked_bikes).to eq([])
    end

    it '#dock accepts an array of bikes' do
      expect{@d.dock([double(:bike), double(:bike)])}.not_to raise_error(Exception)
    end

    it '#dock accepts a bike object' do
      expect{@d.dock(double(:bike))}.not_to raise_error(Exception)
    end
  end

  context 'When dock is full' do
    d = DockingStation.new
    20.times{d.dock(Bike.new)}

    it '#dock raises an error' do
      expect {d.dock(double(:bike))}.to raise_error("Station full.")
    end
  end

  context 'When dock has at least 1 bike' do
    before(:each) do
      @d = DockingStation.new
      @d.dock(Bike.new) end

    it '#has_bikes? returns true' do
      expect(@d.has_bikes?).to eq(true)
    end

    it '#release_bike returns an object' do
      expect(@d.release_bike.class).to eq(Bike)
    end

    it '#release_bike returns a working bike' do
		  expect(@d.release_bike.working?).to eq true
	  end
  end

  context 'When new dock is created' do
      d = DockingStation.new

      it '#docked_bikes contains empty array' do
        expect(d.docked_bikes).to eq([])
      end
  end

  context 'When dock holds a broken bike' do

    let (:bike) { double :bike }
    it 'should not release a broken bike' do
      d = DockingStation.new
      d.dock(bike)
      allow(bike).to receive(:broken).and_return(true)
      expect{d.release_bike}.to raise_error('Bike is broken!')
    end
  end

end
