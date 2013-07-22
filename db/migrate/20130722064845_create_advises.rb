class CreateAdvises < ActiveRecord::Migration
  def change
    create_table :advises do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :last_name
      t.string :name
      t.string :full_name
      t.string :specialty
      t.string :city
      t.string :phone_number
      t.string :description
      t.string :status

      t.timestamps
    end
  end
end
