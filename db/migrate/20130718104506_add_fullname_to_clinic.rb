class AddFullnameToClinic < ActiveRecord::Migration
  def change
    add_column :clinics, :full_name, :string
    add_column :clinics, :last_name, :string
    add_column :clinics, :type, :string
  end
end
