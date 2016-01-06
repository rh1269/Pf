class CommunityMembershipType < ActiveRecord::Migration
  def change
    add_column :community_memberships, :membership_type, :string
  end
end
