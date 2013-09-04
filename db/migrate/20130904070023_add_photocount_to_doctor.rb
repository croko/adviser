class AddPhotocountToDoctor < ActiveRecord::Migration
  def self.up
    add_column :doctors, :photos_count, :integer, default: 0
    add_column :clinics, :photos_count, :integer, default: 0

    Doctor.reset_column_information
    Clinic.reset_column_information

    Photo.where(attachable_type: 'Clinic').each do |c|
      Clinic.reset_counters(c.attachable_id, :photos)
    end
    Photo.where(attachable_type: 'Doctor').each do |c|
      Doctor.reset_counters(c.attachable_id, :photos)
    end
  end

  def self.down
    remove_column :doctors, :photos_count, :integer
    remove_column :clinics, :photos_count, :integer
  end
end
