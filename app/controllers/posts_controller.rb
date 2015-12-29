class PostsController < ApplicationController
  before_action :authenticate_user!

  def home_feed
    if !current_user
      redirect_to '/users/sign_in'
    end   
  end

  def home_json
    follows = Follow.where(follower_id: current_user.id)
    follow_posts = follows.map { |f|
      Post.where(user_id: f['followed_id'])
      }
    @posts =[]
    follow_posts.flatten.each do |post|
      obj = post.attributes
      if post['original_post_id'] != nil
        obj['original_post'] = post.original_post
        obj['original_username'] = post.original_post.user.username   
      end  
      @posts.push(obj)
    end 
     render :json => @posts
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

  def new_comment
    c = Comment.new(user_id: current_user.id, body: params[:comment], post_id: params[:id])
    if params[:parent_id]
      c[:parent_id] = params[:parent_id]
    end    
    c.save
    redirect_to '/posts/' + params[:id]
  end
end
