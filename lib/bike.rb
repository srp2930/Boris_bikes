class Bike
	def working?
		true
	end

	def report_broken
		@broken = true
	end
	
	def broken?
		@broken
	end

	# def broken_bike(bike)
	# 	bike.working? = false
	# end

	def docked?
		false
	end
end
