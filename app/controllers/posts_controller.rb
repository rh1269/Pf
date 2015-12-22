class PostsController < ApplicationController
  before_action :authenticate_user!

  def home_feed
    if !current_user
      redirect_to '/users/sign_in'
    end   
  end
  
  #single post show
  def show
    id = params[:id]
    @post = Post.find_by(id: id)

  end

  #reblog form page display
  def reblog
    @post = Post.find_by(id: params[:id])
  end

  def submit_reblog
    id = params[:id]
    p = Post.new(user_id: current_user.id, community_post: false, original_post_id: id)
    p.save
    redirect_to '/' + current_user[:username]
  end

  #create text post form page
  def text
   #just returns view
  end 

  #create post submit
  def create
    if params[:post_type] == 'text'
      p = Post.new(user_id: current_user.id, title: params[:title], content: params[:content], post_type: params[:post_type], community_post: false)
      p.save
    end
    redirect_to '/' + current_user[:username]
  end

end
