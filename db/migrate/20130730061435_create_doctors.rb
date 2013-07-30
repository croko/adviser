class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :first_name
      t.string :last_name
      t.text :description
      t.string :status
      t.references :user, index: true
      t.references :clinic, index: true
      t.boolean :published
      t.integer :comments_count
      t.float :rating
      t.integer :likes_count
      t.string :education
      t.date :starting_work
      t.date :high_school_finished
      t.string :high_school_name
      t.string :awards
      t.string :visit_home
      t.decimal :price, precision: 8, scale: 2
      t.string :specialty

      t.timestamps
    end
  end
end
