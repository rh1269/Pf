class FollowsController < ApplicationController

  def user_create
    u = User.find_by(username: params[:username])
    f = Follow.new(follower_id: current_user.id, followed_id: u['id'], followed_type: 'User')
  end

  def comm_create
    c = Community.find_by(name: params[:name])
    f = Follow.new(follower_id: current_user.id, followed_id: c['id'], followed_type: 'Community')
  end
end