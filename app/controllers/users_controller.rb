class UsersController < ApplicationController

  def show
    u = User.where(username: params[:username])[0]
    id = u['id']
    @posts = Post.where(user_id: id)
  end
  
end
