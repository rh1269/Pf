class AddRebloggable < ActiveRecord::Migration
  def change
    add_column :posts, :rebloggable, :boolean
  end
end
