class PostsController < ApplicationController
  before_action :authenticate_user!

  def home_feed
    if !current_user
      redirect_to '/users/sign_in'
    end   
  end
  
  def show
    id = params[:id]
    @post = Post.find_by(id: id)

  end

  def reblog
    @post = Post.find_by(id: params[:id])
  end

  def submit_reblog

  end

  def text
   #just returns view
  end 

  def create
    if params[:post_type] == 'text'
      p = Post.new(user_id: current_user.id, title: params[:title], content: params[:content], post_type: params[:post_type], community_post: false)
      p.save
    end
    redirect_to '/' + current_user[:username]
  end

end
