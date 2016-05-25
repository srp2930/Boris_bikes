class DockingStation

  attr_reader :bike
  def initialize
    @bike = []
  end

  def release_bike
     raise "Bike not available" if @bike.count == 0
     @bike.pop
  end

  def dock(bike)
    @bike << bike
  end

end