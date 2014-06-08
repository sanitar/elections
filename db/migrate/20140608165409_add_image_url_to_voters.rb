class AddImageUrlToVoters < ActiveRecord::Migration
  def change
    add_column :voters, :image_url, :string
  end
end
