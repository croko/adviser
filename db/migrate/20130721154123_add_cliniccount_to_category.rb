class AddCliniccountToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :clinics_count, :integer, default: 0
    add_column :categories, :doctors_count, :integer, default: 0
  end
end
