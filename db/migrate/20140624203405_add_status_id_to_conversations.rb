class AddStatusIdToConversations < ActiveRecord::Migration
  def change
    add_column :conversations, :status_id, :integer
  end
end
