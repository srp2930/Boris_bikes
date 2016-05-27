require_relative 'bike'

class DockingStation

  attr_reader :bikes
  attr_accessor :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def dock(bike)
    	#docked? == true
    fail 'Error: Docking Station Full' if full?
  	@bikes << bike
  end

  def release_bike
    	#Bike.new if empty_bikes == false
    fail 'Error. No bikes available' if empty?
    @bikes.pop
  end

  private

  def full?
    @bikes.count >= capacity
  end

  def empty?
    @bikes.empty?
  end
end



# station = DockingStation.new
# 10.times do bike = Bike.new
# end

# p station.full?



  #def empty_bikes
  # return 'Error. No bikes available'
  #end
