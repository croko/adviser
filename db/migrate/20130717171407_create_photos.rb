class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.string :description
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.integer :attachable_id
      t.string :attachable_type
      t.boolean :published
      t.integer :sort_order

      t.timestamps
    end
  end
end
