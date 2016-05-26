require './lib/docking_station.rb'
require './lib/bike.rb'
d = DockingStation.new(30)
d1 = DockingStation.new
b = Bike.new

p 'Docking station accepts broken bike and does not release broken bikes'
broken_bike = Bike.new
broken_bike.broken = true
d.dock(broken_bike)

begin
  p d.release_bike
rescue
  p 'no way jose'
end


p 'report bike as broken or not'
b.broken = false 
p b.broken 
