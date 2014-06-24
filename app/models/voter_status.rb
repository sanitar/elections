# == Schema Information
#
# Table name: voter_statuses
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  active      :boolean
#  created_at  :datetime
#  updated_at  :datetime
#

class VoterStatus < ActiveRecord::Base
	has_many :voters
end
