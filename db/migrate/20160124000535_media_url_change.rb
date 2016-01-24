class MediaUrlChange < ActiveRecord::Migration
  def change
    remove_column :media_urls, :type
    add_column :media_urls, :media_type, :string
  end
end
