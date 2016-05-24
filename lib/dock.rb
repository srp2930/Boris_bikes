class Dock

	attr_reader :docked_bike

	def release_bike
		# Bike.new
		if @docked_bike.nil?
			raise Exception.new("No bikes")
		else
			returnBike = @docked_bike
			@docked_bike = nil
			return returnBike
		end
	end

	def initialize(bike)
		@docked_bike = bike
	end
end
