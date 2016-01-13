class FollowType < ActiveRecord::Migration
  def change
     change_table :likes do |t|
      t.string :followed_type
     end
  end
end
