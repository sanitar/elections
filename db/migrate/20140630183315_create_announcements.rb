class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.string :title
      t.text :body
      t.string :user_id
      t.boolean :visiable, default: false

      t.timestamps
    end
  end
end
