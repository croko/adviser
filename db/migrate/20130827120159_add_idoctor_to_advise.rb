class AddIdoctorToAdvise < ActiveRecord::Migration
  def change
    add_column :advises, :idoctor, :boolean, default: false
    add_column :advises, :iclinic, :boolean, default: false
  end
end
