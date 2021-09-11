class Post < ApplicationRecord

 belongs_to :user
 attachment :post_image
 belongs_to :contributer, class_name:'User', foreign_key: 'user_id'
 has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy

 has_many :comments, dependent: :destroy

  def liked_by(user)
    Like.find_by(user_id: user.id, post_id: id)
  end


end
