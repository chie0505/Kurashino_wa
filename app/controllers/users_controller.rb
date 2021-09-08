class UsersController < ApplicationController

  before_action :authenticate_user!


  def index
    @user = User.find(params[:id])
    @posts = @user.post.page(params[:page]).reverse_order
  end

  def show
    @user = User.find_by(id: params[:id])
  end



end
