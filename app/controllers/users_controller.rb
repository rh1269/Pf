class UsersController < ApplicationController

  #user blog page
  def show
    @user = User.find_by(username: params['username'])
    @following = Follow.find_by(follower_id: current_user.id, followed_id: @user['id'], followed_type: "User")
    @reblogs = Post.where("original_post_id IS NOT NULL AND community_id IS NULL AND user_id = "+ @user.id.to_s).length
    @original_posts = Post.where("original_post_id IS NULL AND community_id IS NULL AND user_id = "+ @user.id.to_s).length
  end

  def show_json
     user_id = User.find_by(username: params[:username])['id']
    p = Post.where(user_id: user_id)
    @posts =[]
    p.each do |post|
      obj = post.attributes
      obj['tags'] = post.tag_list
        if post['original_post_id'] != nil
        obj['original_post'] = post.original_post
        obj['original_username'] = post.original_post.user.username   
      end  
      @posts.push(obj)
    end
    render :json => @posts
  end  
  
end
