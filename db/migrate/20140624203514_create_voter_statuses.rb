class CreateVoterStatuses < ActiveRecord::Migration
  def change
    create_table :voter_statuses do |t|
      t.string :name
      t.text :description
      t.boolean :active

      t.timestamps
    end
  end
end
