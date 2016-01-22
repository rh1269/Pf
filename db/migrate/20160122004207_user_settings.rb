class UserSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.references :user
      t.string :timezone
    end
  end
end
