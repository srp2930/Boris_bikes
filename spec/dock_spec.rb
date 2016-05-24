require './lib/dock.rb'

describe Dock do

	before(:each) do
		@dock = Dock.new
	end

	it 'is not nil' do
		expect(@dock).not_to be nil
	end

	it 'respond to release_bike' do
		expect(@dock).to respond_to(:release_bike)
	end

	it 'get\'s a bike and checks if it works' do
		expect(@dock.release_bike.class).to eq Bike
		expect(@dock.release_bike.working?).to eq true
	end
end