# == Schema Information
#
# Table name: conversations
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  voter_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Conversation < ActiveRecord::Base
	belongs_to :user
	belongs_to :voter
end
