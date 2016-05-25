require './lib/docking_station.rb'
require './lib/bike.rb'
d = DockingStation.new
d.dock([Bike.new])
p d.release_bike.class
#d.dock(Array.new(21,Bike.new))
#p d.docked_bikes.size
#puts "Size should be twenty"
#p d.dock([Bike.new])
