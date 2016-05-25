require_relative 'bike'

class DockingStation
	attr_reader :docked_bike

  def initialize
    @docked_bike = Bike.new
  end

	def release_bike
		if @docked_bike == nil
			raise "No bikes available."
		else 
      released_bike = @docked_bike
      @docked_bike = nil
      released_bike 
		end
	end
	
	def dock(bike)
		@docked_bike = bike
	end
	
	def docked?
		if @docked_bike != nil then return true
		else return false
		end	
	end
end
