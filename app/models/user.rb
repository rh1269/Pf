class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :community_memberships

  has_many :followers, class_name: "Follow", foreign_key: :followed_id
  has_many :following, class_name: "Follow", foreign_key: :follower_id

end
