class CreateDataPackets < ActiveRecord::Migration
  def change
    create_table :data_packets do |t|
      t.string :title
      t.integer :user_id
      t.attachment :packet

      t.timestamps
    end
  end
end
