class WorkingController < ApplicationController
  def page
    @users = User.all
  end
end
