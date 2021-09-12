class UsersController < ApplicationController

  before_action :authenticate_user!


  def index
    @user = User.find(params[:id])
    @posts = @user.post.page(params[:page]).reverse_order
  end

  def show
    @user = User.find_by(id: params[:id])
  end



    def following
        #@userがフォローしているユーザー
        @user  = User.find(params[:id])
        @users = @user.following
        render 'show_follow'
    end

    def followers
        #@userをフォローしているユーザー
        @user  = User.find(params[:id])
        @users = @user.followers
        render 'show_follower'
    end











def user_params
  params.require(:user).permit(:name, :self_introduction, :profile_image)
end










end
