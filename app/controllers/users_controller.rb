class UsersController < ApplicationController
  def index
    @user = User.find(params[:id])
    @posts = @user.post.page(params[:page]).reverse_order
  end
end
