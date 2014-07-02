class CreatePatterns < ActiveRecord::Migration
  def change
    create_table :patterns do |t|
      t.text :text
      t.boolean :first_name
      t.boolean :last_name
      t.boolean :middle_name
      t.boolean :district
      t.boolean :email
      t.boolean :mobile
      t.boolean :skype
      t.boolean :age
      t.boolean :sex
      t.boolean :conversation_status

      t.timestamps
    end
  end
end
