class CreateVisionImages < ActiveRecord::Migration[5.2]
  def change
    create_table :vision_images do |t|
    	t.string :image_id

    t.timestamps
    end
  end
end
