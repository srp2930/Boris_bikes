require 'docking_station'

describe DockingStation do
	it {is_expected.to respond_to :release_bike}
	it "returns bike & bike is working" do
		bike = subject.release_bike
		expect(bike.working?).to eq true
	end
	it { is_expected.to respond_to(:dock).with(1).argument }
	it { is_expected.to respond_to(:docked?)}
	it "returns true if bike is docked" do
		bike = subject.release_bike
		subject.dock(bike)
		expect(subject.docked?).to eq true
	end

  context 'when no bike exists' do
      d = DockingStation.new
      d.release_bike

    it "#release_bike returns an error." do
      expect {d.release_bike}.to raise_error("No bikes available.")
    end

    it "#docked_bike is empty ." do
      expect(d.docked_bike).to be_nil
    end
  end

  context 'when dock is full' do
    it '#dock raises an error' do
      expect {subject.dock(Bike.new)}.to raise_error("Station full.")
    end
  end
end
