class AddFieldsToVoters < ActiveRecord::Migration
  def change
    add_column :voters, :bdate, :datetime
  end
end
