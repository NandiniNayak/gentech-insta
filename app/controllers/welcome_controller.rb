class WelcomeController < ApplicationController
  def page
    @blogs = Blog.all
    @comment = Comment.new
  end
end
