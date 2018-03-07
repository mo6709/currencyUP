class Sort
	def self.find_in_array(array, secs_int)
		startpoint = 0
		endpoint = array.length - 1
		guess_position = ((endpoint - startpoint) / 2).to_i

		while startpoint != endpoint
			if array[guess_position]["time"] < secs_int
				startpoint = guess_position
				guess_position = startpoint + ((endpoint - startpoint).to_f / 2).round
			elsif array[guess_position]["time"] > secs_int
				endpoint = guess_position
				guess_position = startpoint + ((endpoint - startpoint).to_f / 2).round
			elsif array[guess_position]["time"] === secs_int
				return array[guess_position]
			end
		end	
	end
end