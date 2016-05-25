class DockingStation

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
     raise "Bike not available" if @bikes.empty?
     @bikes.pop
  end

  def dock(bike)
    raise "Dock is full" if @bikes.count >= 20
    @bikes << bike
  end

end
