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

end
