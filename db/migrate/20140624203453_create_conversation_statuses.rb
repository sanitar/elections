class CreateConversationStatuses < ActiveRecord::Migration
  def change
    create_table :conversation_statuses do |t|
      t.string :name
      t.text :description
      t.boolean :active

      t.timestamps
    end
  end
end
