class RelationshipsController < ApplicationController
  before_action :set_user

  def create
    @user = User.find(params[:relationship][:following_id])
    current_user.follow(@user)
    # ここから
    @user.create_notification_follow!(current_user)
    following = current_user.follow(@user)
    if following.save
      flash[:success] = 'ユーザーをフォローしました'
      @user.create_notification_follow!(current_user)
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
    end
  end

  def destroy
    @user = User.find(params[:id])
    current_user.unfollow(@user)
    following = current_user.unfollow(@user)
    if following.destroy
      flash[:success] = 'ユーザーのフォローを解除しました'

    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'

    end
  end

  private
  def set_user
    @user = User.find(params[:follow_id])
  end

end
