class PostsController < ApplicationController
  before_action :authenticate_user!

  def home_feed
    if !current_user
      redirect_to '/users/sign_in'
    end   
  end
  
  def show
    id = params[:id]
    @p = Post.find_by(id: id)

  end

  def create

  end

end
