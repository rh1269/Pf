class Post < ActiveRecord::Base
	belongs_to :user
  belongs_to :original_post, class_name: "Post",
                          foreign_key: "original_post_id"
end