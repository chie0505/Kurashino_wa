class CreatePostImages < ActiveRecord::Migration[5.2]
  def change
    create_table :post_images do |t|
      t.string :image, null: false
      t.references :post, foreign_key: true, null: false

      t.timestamps
    end
  end
end
