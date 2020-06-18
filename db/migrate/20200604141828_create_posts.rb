class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|

    	t.string :title
    	t.text :body
    	t.float :rate
    	t.integer :user_id
    	t.integer :genre_id
    	t.integer :favorite_id
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
