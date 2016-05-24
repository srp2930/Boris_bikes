require './lib/dock.rb'
require './lib/bike.rb'


describe Dock do

	before(:each) do
		@dock = Dock.new(Bike.new)
	end

	it 'expects #new to have an argument' do
		expect{Dock.new(Bike.new)}.to_not raise_error
	end

	it 'respond to release_bike' do
		expect(@dock).to respond_to(:release_bike)
	end

	it 'returns a bike and checks if it works' do
		testBike = @dock.release_bike
		expect(testBike.class).to eq Bike
		expect(testBike.working?).to eq true
	end

	it '#docked_bike returns instance variable @docked_bike' do
		expect(@dock.docked_bike.class).to eq Bike
	end

	it '#release_bike raise an error if dock is empty' do
		expect{2.times{@dock.release_bike}}.to raise_error
	end

end
