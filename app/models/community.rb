class Community < ActiveRecord::Base
	belongs_to :user
  has_many :community_memberships
  has_many :posts
  has_many :blocking, class_name: "Block", foreign_key: :blocked_from_id,  as: :blocked_from
end