class ChamgePublishedInDoctor < ActiveRecord::Migration
  def change
    change_column :doctors, :published, :boolean, default: true
  end
end
