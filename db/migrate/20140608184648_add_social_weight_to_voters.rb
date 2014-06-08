class AddSocialWeightToVoters < ActiveRecord::Migration
  def change
    add_column :voters, :social_weight, :integer
    add_index :voters, :social_weight
  end
end
