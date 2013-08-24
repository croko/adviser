class AddAdviseToDoctor < ActiveRecord::Migration
  def change
    add_column :doctors, :advise_id, :integer
    add_column :clinics, :advise_id, :integer
  end
end
