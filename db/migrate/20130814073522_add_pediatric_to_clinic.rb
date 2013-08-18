class AddPediatricToClinic < ActiveRecord::Migration
  def change
    add_column :clinics, :pediatric, :boolean, default: false
  end
end
