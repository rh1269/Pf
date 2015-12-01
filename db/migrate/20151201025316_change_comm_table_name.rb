class ChangeCommTableName < ActiveRecord::Migration
  def change
    rename_table :communities_tables, :communities
  end
end
