class AddLastSeenToVoters < ActiveRecord::Migration
  def change
    add_column :voters, :last_seen, :datetime
  end
end
