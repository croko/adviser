class RemoveFieldsFromClinic < ActiveRecord::Migration
  def change
    remove_column :clinics, :name, :string
    remove_column :clinics, :last_name, :string
    remove_column :clinics, :education, :string
    remove_column :clinics, :high_school_name, :string
    remove_column :clinics, :high_school_finished, :date
  end
end
