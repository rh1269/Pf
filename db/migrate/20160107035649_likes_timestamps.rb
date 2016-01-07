class LikesTimestamps < ActiveRecord::Migration
  def change
    change_table :likes do |t|
            t.timestamps
        end
  end
end
