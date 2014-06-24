# == Schema Information
#
# Table name: conversations
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  voter_id   :integer
#  created_at :datetime
#  updated_at :datetime
#  status_id  :integer
#

class Conversation < ActiveRecord::Base
	belongs_to :user
	belongs_to :voter

	belongs_to :status, class_name: "ConversationStatus", foreign_key: :status_id
end
