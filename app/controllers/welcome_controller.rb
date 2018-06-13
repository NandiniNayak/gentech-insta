class WelcomeController < ApplicationController
  def page
    @blogs = Blog.all
    @comment = Comment.new
    @users = User.all
  end
end
