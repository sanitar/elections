# == Schema Information
#
# Table name: educations
#
#  id           :integer          not null, primary key
#  school_vk_id :integer
#  voter_id     :integer
#  year_from    :integer
#  year_to      :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Education < ActiveRecord::Base

	belongs_to :voter
	belongs_to :school, primary_key: :vk_id, foreign_key: :school_vk_id
end
