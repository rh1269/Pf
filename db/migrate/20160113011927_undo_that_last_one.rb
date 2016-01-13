class UndoThatLastOne < ActiveRecord::Migration
  def change
    
      remove_column :likes, :followed_type, :string
  
  end
end
