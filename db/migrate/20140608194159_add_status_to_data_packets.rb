class AddStatusToDataPackets < ActiveRecord::Migration
  def change
    add_column :data_packets, :status, :integer, default: 0
  end
end
