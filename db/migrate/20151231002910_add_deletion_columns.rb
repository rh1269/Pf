class AddDeletionColumns < ActiveRecord::Migration
  def change
    add_column :posts, :deleted, :boolean
    add_column :posts, :deleted_at, :datetime
    add_column :comments, :deleted, :boolean
    add_column :comments, :deleted_at, :datetime
  end
end
