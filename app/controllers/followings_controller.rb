class FollowingsController < ApplicationController
  def create
    @following = current_user.followings.new(:follower_id => params[:elphant])
    @following.user_id = current_user.id
    flash[:notice] = "followed succesfully"
    @following.save
    redirect_to root_path
  end

end
