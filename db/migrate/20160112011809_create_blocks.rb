class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.integer :blocked_id
      t.integer :blocked_from_id
      t.string :blocked_from_type
      t.timestamps
    end
  end
end
