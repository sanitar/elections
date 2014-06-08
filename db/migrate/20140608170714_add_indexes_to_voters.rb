class AddIndexesToVoters < ActiveRecord::Migration
  def change
  	add_index :voters, :vk_id, :unique => true
    add_index :voters, :district
    add_index :voters, :can_write
  end
end
