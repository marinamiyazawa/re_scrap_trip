class CreateLandmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :landmarks do |t|
      t.string :name
      t.decimal :score
      t.string :locations
      t.string :latitude
      t.string :longitude
      t.integer :vision_image_id

      t.timestamps
    end
  end
end
