class FollowTypeAgain < ActiveRecord::Migration
  def change
    add_column :follows, :followed_type, :string
  end
end
