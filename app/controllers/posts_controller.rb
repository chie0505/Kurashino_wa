class PostsController < ApplicationController

before_action :authenticate_user!

  def index
    @posts = Post.all
  end


  def new
     @post = Post.new
  end


  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to @post
  end


  def show


  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :post_image_id, :caption, :user_id,)
    end
end


