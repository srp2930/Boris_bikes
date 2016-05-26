require_relative 'bike'

class DockingStation
	attr_reader :docked_bikes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @docked_bikes = []
    @capacity = capacity
  end

	def release_bike
		if @docked_bikes == []
			raise "No bikes available."
		elsif @docked_bikes.last.broken == true
      raise 'Bike is broken!'
    else
      @docked_bikes.pop
		end
	end

	def dock(bikes)
    bikes = [bikes].flatten

    if full?
      raise "Station full."
    elsif bikes == []
      raise "No bikes in the input array"
    elsif n_of_input_bikes_small_enough?(bikes)
       (@docked_bikes << bikes).flatten!
    else
      raise 'Not enough capacity in dock to accommodate bikes in array'
    end
	end

	def has_bikes?
		if @docked_bikes.length != 0
      true
    else
      false
    end
	end

private

  def full?
    @docked_bikes.length >= DEFAULT_CAPACITY
  end

  def n_of_input_bikes_small_enough?(bikes)
    (@docked_bikes.length + bikes.length) <= DEFAULT_CAPACITY
  end

end
