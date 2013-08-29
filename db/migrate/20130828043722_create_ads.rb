class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.references :page, index: true
      t.string :name
      t.references :category, index: true
      t.references :doctor, index: true
      t.references :clinic, index: true
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.boolean :published, default: false
      t.integer :sort_order, default: 0
      t.datetime :date_start
      t.datetime :date_end

      t.timestamps
    end
    add_index :ads, [:date_start], :name => "ads_date_start_index"
    add_index :ads, [:date_end], :name => "ads_date_end_index"
  end
end
