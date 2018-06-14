class FollowController < ApplicationController
  def page
    @users = User.all
  end
end
