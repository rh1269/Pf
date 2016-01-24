class CreateMediaUrls < ActiveRecord::Migration
  def change
    create_table :media_urls do |t|
      t.references :post
      t.string :url
      t.string :type
      t.timestamps
    end
  end
end
