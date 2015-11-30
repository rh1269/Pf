class ChangeTableName < ActiveRecord::Migration
  def change
    rename_table :posts_tables, :posts
  end
end
