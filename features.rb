require './lib/docking_station.rb'
require './lib/bike.rb'
dock = DockingStation.new
bike = Bike.new
p dock.dock(bike)
