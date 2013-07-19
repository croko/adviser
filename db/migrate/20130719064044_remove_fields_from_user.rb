class RemoveFieldsFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :name, :string
    remove_column :users, :rating, :float
    remove_column :users, :likes_count, :integer
    remove_column :users, :comments_count, :integer
    remove_column :users, :category_id, :integer
    remove_column :users, :published, :boolean
  end
end
