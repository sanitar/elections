class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.integer :school_vk_id
      t.integer :voter_id
      t.integer :year_from
      t.integer :year_to

      t.timestamps
    end
  end
end
