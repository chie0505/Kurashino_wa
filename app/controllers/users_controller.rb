class UsersController < ApplicationController

  before_action :authenticate_user!


  def index
    @user = User.find(params[:id])
    @posts = @user.post.page(params[:page]).reverse_order
  end

  def show
    @user = User.find_by(id: params[:id])
  end


def user_params
  params.require(:user).permit(:name, :self_introduction, :profile_image) 
end




end
