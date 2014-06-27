class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :value
      t.string :role_id
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
