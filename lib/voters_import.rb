module VotersImport
	require 'csv'

	def self.import (filepath = '/Users/pan/Projects/elections/tmp/test.csv')

		body = File.read(filepath)

		body.each_line.with_index do |line, index| 
			begin
				next if index == 0
				
				row = CSV.parse(line)
				id, social_weight, name, surname, image, region, last_seen, schoolsIds, canWrite = row[0]

				voter = Voter.create({
					vk_id: id,
					social_weight: social_weight,
					first_name: name,
					last_name: surname,
					image_url: image,
					district: region,
					can_write: canWrite
				})

				schoolsIds.to_s.split(',').each do |school_id|
					Education.create!({voter_id: id, school_vk_id: school_id})
				end

			rescue => e
				puts e
			end
		end
	end
end