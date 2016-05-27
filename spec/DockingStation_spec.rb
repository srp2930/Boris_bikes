#describe docking station

require 'DockingStation'

describe DockingStation do

	let(:bike) { double :bike }

	it "responds to release_bike" do
		expect(subject).to respond_to :release_bike
	end

	it "releases the working bike" do
		allow(bike).to receive(:broken?).and_return(false)
		subject.dock(bike) 
		released_bike = subject.release_bike
		expect(released_bike).not_to be_broken
	end

	it "does not release a broken bike" do
		allow(bike).to receive(:broken?).and_return(true)
		subject.dock(bike)
		expect {subject.release_bike}.to raise_error 'ERROR: BIKE IS BROKEN'
	end 

	it "docks the bike" do
		expect(subject).to respond_to :dock
	end

	describe '#release_bike' do

		it 'releases bike' do
			allow(bike).to receive(:broken?).and_return(false)
			subject.dock(bike)
			expect(subject.release_bike).to eq bike
		end

		it 'raises error if no bikes available' do
			expect {subject.release_bike}.to raise_error 'Error. No bikes available'
		end

		describe '#dock' do

			it 'raises error when station is full' do
				DockingStation::DEFAULT_CAPACITY.times {subject.dock double(:bike)}
				expect {subject.dock double(:bike)}.to raise_error 'Error: Docking Station Full'
			end

			it 'accepts a broken bike' do 
				allow(bike).to receive(:report_broken).and_return true
				expect {subject.dock(bike)}.not_to raise_error
			end

			describe 'DEFAULT_CAPACITY' do
				it 'gives a DEFAULT_CAPACITY of 20' do
					expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
				end

# it "returns true if dock is full" do
# 	#bike = Bike.new
# 	expect (DockingStation.full?).to eq false
	#20.times {bike = Bike.new}
	#expect {subject.full?}.to eq true
end
end
end
end
