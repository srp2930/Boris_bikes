require_relative 'bike'

class DockingStation
	attr_reader :docked_bike

  def initialize
    @docked_bike = Bike.new
    @full = true
  end

	def release_bike
		if @docked_bike == nil
			raise "No bikes available."
		else 
      released_bike = @docked_bike
      @docked_bike = nil
      @full = false
      released_bike 
		end
	end
	
	def dock(bike)
    @full ? (raise "Station full.") : (@docked_bike = bike ; @full = false)
	end
	
	def docked?
		if @docked_bike != nil then return true
		else return false
		end	
	end
end
