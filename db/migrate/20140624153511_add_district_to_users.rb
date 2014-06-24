class AddDistrictToUsers < ActiveRecord::Migration
  def change
    add_column :users, :district_id, :integer, default: 0
  end
end
