class SetDefaultToDoctor < ActiveRecord::Migration
  def change
    change_column :doctors, :rating, :float, default: 0
    change_column :doctors, :comments_count, :integer, default: 0
    change_column :doctors, :likes_count, :integer, default: 0
    change_column :clinics, :rating, :float, default: 0
    change_column :clinics, :comments_count, :integer, default: 0
    change_column :clinics, :likes_count, :integer, default: 0
  end
end
