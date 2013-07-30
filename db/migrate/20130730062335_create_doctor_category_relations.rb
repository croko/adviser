class CreateDoctorCategoryRelations < ActiveRecord::Migration
  def change
    create_table :doctor_category_relations do |t|
      t.references :doctor, index: true
      t.references :category, index: true

      t.timestamps
    end
  end
end
