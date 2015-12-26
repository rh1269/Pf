class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts

  has_many :following_me, class_name: "Follow", foreign_key: :follower_id
  has_many :followers, through: :following_me

  has_many :followees, class_name: "Follow", foreign_key: :followee_id
  has_many :following, through: :followees
end
