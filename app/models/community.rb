class Community < ActiveRecord::Base
	belongs_to :user
  has_many :community_memberships
  has_many :posts
end