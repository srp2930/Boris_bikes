class Dock
  
  attr_reader :docked_bike

	def release_bike 
		Bike.new
	end

  def initialize(bike)
    @docked_bike = bike
  end
end
