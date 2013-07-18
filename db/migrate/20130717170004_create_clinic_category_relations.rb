class CreateClinicCategoryRelations < ActiveRecord::Migration
  def change
    create_table :clinic_category_relations do |t|
      t.integer :category_id
      t.integer :clinic_id

      t.timestamps
    end
    add_index :clinic_category_relations, [:category_id], :name => "clinic_category_id_index"
    add_index :clinic_category_relations, [:clinic_id], :name => "clinic_clinic_id_index"
  end
end
