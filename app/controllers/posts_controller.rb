class PostsController < ApplicationController

before_action :authenticate_user!

  def index
    @posts = Post.limit(10).order('created_at DESC')
    @post = Post.new
  end


  def search
  @posts = Post.search(params[:keyword])
  @keyword = params[:keyword]
  render "index"
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
    @post = Post.find(params[:id])
    @post.destroy
    flash[:info]="投稿を取り消しました"
    redirect_to posts_path
  end

  def search
    @posts = Post.search_caption_for(params[:q])
  end


  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :post_image, :caption, :user_id,)
    end



  def user_params
    params.require(:user).permit(:name, :self_introduction, :profile_image)
  end


    def correct_user

      post=Post.find(params[:id])
      contributer=post.contributer
      unless current_user==contributer
        session[:danger] = "このページにはアクセスできません"
        redirect_to root_url
      end
    end




end