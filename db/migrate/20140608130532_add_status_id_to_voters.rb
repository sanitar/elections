class AddStatusIdToVoters < ActiveRecord::Migration
  def change
    add_column :voters, :status_id, :integer
  end
end
