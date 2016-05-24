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
		expect(@dock.release_bike.class).to eq Bike
		expect(@dock.release_bike.working?).to eq true
	end

	it '#docked_bike returns instance variable @docked_bike' do
		expect(@dock.docked_bike.class).to eq Bike
	end
  
end
