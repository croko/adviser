class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.boolean :pediatric, default: false

      t.timestamps
    end
  end
end
