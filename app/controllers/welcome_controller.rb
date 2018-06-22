class WelcomeController < ApplicationController
  def page
    # if there is no profile created yet get the suer to create profile from home page
    if !current_user.profile
      @profile = Profile.new
    else
      @blogs = Blog.all
      @comment = Comment.new
    end
  end
end
