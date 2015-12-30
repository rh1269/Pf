class ChangeColumn < ActiveRecord::Migration
  def change
    remove_column :posts, :community_post
    add_column :posts, :community_id, :integer
  end
end
