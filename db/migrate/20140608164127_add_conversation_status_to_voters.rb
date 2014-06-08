class AddConversationStatusToVoters < ActiveRecord::Migration
  def change
    add_column :voters, :conversation_status, :integer, default: 0
  end
end
