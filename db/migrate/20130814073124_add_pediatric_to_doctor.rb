class AddPediatricToDoctor < ActiveRecord::Migration
  def change
    add_column :doctors, :pediatric, :boolean, default: false
  end
end
