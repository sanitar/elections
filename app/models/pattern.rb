require 'set'
class Pattern < ActiveRecord::Base

	@@fields_set = Set.new ["first_name", "last_name", "middle_name", "district",
							 "email", "mobile", "skype", "age", "sex", "conversation_status"]

	def self.suitable_for(voter)
		query = "TRUE and"
		fields = voter.attributes
		fields.each_pair {|k,v|
			if ((@@fields_set.include?(k)) && (v.nil?))
				query = query + " #{k} = false and"
			end
		}
		query = query.slice(0, query.length - 4)
		where(query) # TODO: add filtration by required fields
	end

end
