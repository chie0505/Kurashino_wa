class Post < ApplicationRecord

 belongs_to :user
 attachment :post_image
 belongs_to :contributer, class_name:'User', foreign_key: 'user_id'


end
