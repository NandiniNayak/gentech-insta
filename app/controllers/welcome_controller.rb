class WelcomeController < ApplicationController
  def page
    @blogs = Blog.all
  end
end
