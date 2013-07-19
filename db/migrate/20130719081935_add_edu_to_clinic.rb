class AddEduToClinic < ActiveRecord::Migration
  def change
    add_column :clinics, :education, :string
    add_column :clinics, :starting_work, :date
    add_column :clinics, :high_school_name, :string
    add_column :clinics, :high_school_finished, :date
    add_column :clinics, :awards, :string
    add_column :clinics, :visit_home, :boolean
    add_column :clinics, :price, :decimal, :precision => 8, :scale => 2, :default => 0.0
  end
end
