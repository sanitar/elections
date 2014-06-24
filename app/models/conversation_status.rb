# == Schema Information
#
# Table name: conversation_statuses
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  active      :boolean
#  created_at  :datetime
#  updated_at  :datetime
#

class ConversationStatus < ActiveRecord::Base
	has_many :conversations
end
