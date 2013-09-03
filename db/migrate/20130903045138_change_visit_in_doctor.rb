class ChangeVisitInDoctor < ActiveRecord::Migration
  def change
    remove_column :doctors, :visit_home
    remove_column :clinics, :visit_home
    add_column :doctors, :visit_home, :boolean, default: false
    add_column :clinics, :visit_home, :boolean, default: false
  end
end
