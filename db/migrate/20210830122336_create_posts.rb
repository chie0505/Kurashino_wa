class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :post_image_id
      t.text :caption
      t.integer :user_id

      t.timestamps
    end
  end
end
