class CreatePostsTable < ActiveRecord::Migration
  def change
    create_table :posts_tables do |t|
      t.references :user
      t.string :title
      t.text :content
      t.string :post_type
      t.boolean :community_post
      t.integer :original_post_id
      t.timestamps
    end
  end
end
