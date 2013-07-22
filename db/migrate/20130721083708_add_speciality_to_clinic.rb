class AddSpecialityToClinic < ActiveRecord::Migration
  def change
    add_column :clinics, :specialty, :string
  end
end
