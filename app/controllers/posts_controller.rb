class PostsController < ApplicationController
  before_action :authenticate_user!

  def home_feed
    if !current_user
      redirect_to '/users/sign_in'
    end   
  end

end
