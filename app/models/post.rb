class Post < ActiveRecord::Base
	belongs_to :user
  belongs_to :original_post, class_name: "Post",
                          foreign_key: "original_post_id"
  has_many :reblogs, class_name: "Post", foreign_key: :original_post_id
  has_many :comments, class_name: "Comment"
  belongs_to :community
  has_many :likes
  acts_as_taggable
end