class RenameReviewInUser < ActiveRecord::Migration
  def change
    rename_column :users, :reviews_count, :comments_count
    rename_column :clinics, :reviews_count, :comments_count
  end
end
