class AddDescriptionToUser < ActiveRecord::Migration
  def change
    add_column :users, :rating, :float
    add_column :users, :published, :boolean, default: true
    add_column :users, :status, :string
    add_column :users, :description, :text
  end
end
