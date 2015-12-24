class User < ActiveRecord::Base
  belongs_to :user
  has :user

end