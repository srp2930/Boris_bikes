require './lib/docking_station.rb'
require './lib/bike.rb'
d = DockingStation.new(30)
b = DockingStation.new
p b.capacity == DockingStation::DEFAULT_CAPACITY
p d.capacity
p d
p b

