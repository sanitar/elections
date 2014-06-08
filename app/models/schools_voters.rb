class SchoolsVoters < ActiveRecord::Base
	belongs_to :voter, class_name: "Voter"
	belongs_to :school, class_name: "School", foreign_key: :vk_id, primary_key: :school_vk_id
end
