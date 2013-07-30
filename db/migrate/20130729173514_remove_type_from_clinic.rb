class RemoveTypeFromClinic < ActiveRecord::Migration
  def change
    remove_column :clinics, :type, :string
  end
end
