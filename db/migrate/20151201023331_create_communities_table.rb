class CreateCommunitiesTable < ActiveRecord::Migration
  def change
    create_table :communities_tables do |t|
      t.references :user
      t.string :name
      t.timestamps
    end
  end
end
