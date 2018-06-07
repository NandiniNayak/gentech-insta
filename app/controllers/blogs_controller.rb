class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :vote]

  # before_action :set_like, only: [:vote]

def vote
  case current_user.voted_as_when_voted_for(@blog)
    # if note voted yet
  when nil
    @blog.upvote_by current_user
  when true
    # if already voted
    @blog.unvote_by current_user
  when false
    # if voted and then unvoted
    @blog.upvote_by current_user
  else

  end
    redirect_to root_path(anchor: @blog.id)
end
  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.all
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)
    # link the profile id to the blog's profile_id from the back end
    @blog.profile_id = current_user.profile.id
    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # def set_like
    #   @blog = Blog.find(params[:blog_id])
    # end
    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:status, :profile_id)
    end
end
