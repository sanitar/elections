class CreateVoters < ActiveRecord::Migration
  def change
    create_table :voters do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.integer :vk_id
      t.string :district
      t.string :email
      t.string :mobile
      t.string :skype
      t.integer :age
      t.integer :sex
      t.boolean :can_write

      t.timestamps
    end
  end
end
