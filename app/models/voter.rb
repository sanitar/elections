# == Schema Information
#
# Table name: voters
#
#  id          :integer          not null, primary key
#  first_name  :string(255)
#  last_name   :string(255)
#  middle_name :string(255)
#  vk_id       :integer
#  district    :string(255)
#  email       :string(255)
#  mobile      :string(255)
#  skype       :string(255)
#  age         :integer
#  sex         :integer
#  can_write   :boolean
#  created_at  :datetime
#  updated_at  :datetime
#

class Voter < ActiveRecord::Base

	has_many :educations
	has_many :schools, through: :educations

	belongs_to :status

end
