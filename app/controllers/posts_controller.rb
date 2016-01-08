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
      obj['tags'] = post.tag_list
      obj['username'] = post.user.username
      obj['comments_count'] = post.comments.length
      obj['reblog_count'] = post.reblogs.length
      obj['likes_count'] = post.likes.length
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
    @comments = Comment.where(post_id: id)
  end

  def show_json
    post = Post.find_by(id: params[:id])
    obj = post.attributes
      obj['tags'] = post.tag_list
      obj['username'] = post.user.username
      obj['comments_count'] = post.comments.length
      obj['reblog_count'] = post.reblogs.length
      obj['likes_count'] = post.likes.length
      obj['comments'] = post.comments
    render :json => obj
  end

  #reblog form page display
  def reblog
    @post = Post.find_by(id: params[:id])
  end

  def submit_reblog
    id = params[:id]
    p = Post.new(user_id: current_user.id, original_post_id: id)
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
      p = Post.new(user_id: current_user.id, title: params[:title], content: params[:content], post_type: params[:post_type])
    end
    p.tag_list.add(params[:tags], parse: true)
    p.save
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
