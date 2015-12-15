class UsersController < ApplicationController
  def show
    u = User.where(username: params[:username])
    @posts = Post.where(user_id: u.id)
  end
end
