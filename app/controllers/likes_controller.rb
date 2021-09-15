class LikesController < ApplicationController



 def create
  @like = current_user.likes.build(like_params)
  @post = @like.post
  @like.save
  post = Post.find(params[:post_id])
  post.create_notification_like!(current_user)
 end


 def destroy
  @like = Like.find_by(id: params[:id])
  @post = @like.post
  @like.destroy
 end

 private
   def like_params
     params.permit(:post_id)
   end

end
