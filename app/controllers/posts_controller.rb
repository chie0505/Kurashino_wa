class PostsController < ApplicationController

before_action :authenticate_user!

  def index
    @posts = Post.all
    @post = Post.new
  end


  def new
     @post = Post.new
  end


  def create
    @post=current_user.posts.build(post_params)
    # =以下2文を含む
    # @post = Post.new(post_params)
    # @post.user_id = current_user.id
    if @post.save
　　# flash[:success] = "投稿しました"
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { redirect_to root_path }
      end
    else
        respond_to do |format|
        format.html { render 'posts/_new' }
        format.js
        end
    end
  end




 def show
    @post=Post.find(params[:id])
    respond_to do |format|
      format.html { render 'posts/_show' }
      format.js
    end
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


