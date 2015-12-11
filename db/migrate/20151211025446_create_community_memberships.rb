class CreateCommunityMemberships < ActiveRecord::Migration
  def change
    create_table :community_memberships do |t|
      t.references :user
      t.references :community
      t.timestamps
    end
  end
end
