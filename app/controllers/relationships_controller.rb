class RelationshipsController < ApplicationController
  before_action :set_user

  def create

    # @user = User.find params[:follow_id]
    following = current_user.follow(@user)
    following.save
    # @user = User.find(params[:relationship][:following_id])
    @user.create_notification_follow!(current_user)



  end

  def destroy
    following = current_user.unfollow(@user)
    following.destroy
  end

  def index
    user = User.find(params[@user])
    @users = user.followings
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end



  private

  def set_user
    @user = User.find(params[:follow_id])
  end



end
