module VotersImport
	require 'csv'

	def self.import (id)
		packet = DataPacket.find_by_id(id)
		body = Paperclip.io_adapters.for(packet.packet).read

		body.each_line.with_index do |line, index| 
			begin
				next if index == 0
				
				row = CSV.parse(line)
				id, social_weight, name, surname, image, region, last_seen, schoolsIds, canWrite, bdate, sex = row[0]
				#id;social_weight;name;surname;image;region;last_seen;schoolsIds;canWrite;bdate;sex;

				voter = Voter.create({
					vk_id: id,
					social_weight: social_weight,
					first_name: name,
					last_name: surname,
					image_url: image,
					district: region,
					can_write: canWrite,
					last_seen: Time.at(last_seen).to_datetime,
					bdate: bdate,
					sex: sex
				})

				schoolsIds.to_s.split(',').each do |school_id|
					Education.create!({voter_id: id, school_vk_id: school_id})
				end

			rescue => e
				puts e
			end
		end
		packet.update_column(:status, 1)
	end
end