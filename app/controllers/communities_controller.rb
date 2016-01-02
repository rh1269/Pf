class CommunitiesController < ApplicationController

  def show 
    @comm = Community.find_by(name: params[:name])
  end

  def create

  end

  def create_submit
    user_id = current_user.id
    name = params[:name]
    c = Community.create(user_id: user_id, name: name)
    c.save
    redirect_to '/community/'+URI.encode(name)
  end

  def join
    comm = Community.where(name: params[:name])[0]
    c.save
    redirect_to '/community/'+URI.encode(name)
  end

  def leave
    comm = Community.where(name: params[:name])[0]
    c = CommunityMembership.where(user_id: current_user.id, community_id: comm['id'])
    c.delete
    redirect_to '/community/'+URI.encode(name)
  end

end
