class CommunityMembership < ActiveRecord::Base
	belongs_to :user
	belongs_to :community

  #membership types are: can_view, can_post, moderator, banned
end