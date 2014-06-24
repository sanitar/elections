class Pattern < ActiveRecord::Base

	def self.suitable_for(voter)
		where('TRUE') # TODO: add filtration by required fields
	end

end
