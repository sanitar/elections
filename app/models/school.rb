# == Schema Information
#
# Table name: schools
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  vk_id      :integer
#  created_at :datetime
#  updated_at :datetime
#

class School < ActiveRecord::Base

	has_many :educations, primary_key: :vk_id, foreign_key: :school_vk_id
	has_many :voters, through: :educations

end
