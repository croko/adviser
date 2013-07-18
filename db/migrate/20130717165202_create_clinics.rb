class CreateClinics < ActiveRecord::Migration
  def change
    create_table :clinics do |t|
      t.string :name
      t.text :description
      t.string :status
      t.integer :user_id
      t.boolean :published, default: true
      t.integer :reviews_count
      t.float :rating
      t.integer :likes_count

      t.timestamps
    end
  end
end
