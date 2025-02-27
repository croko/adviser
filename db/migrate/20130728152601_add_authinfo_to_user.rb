class AddAuthinfoToUser < ActiveRecord::Migration
  def change
    add_column :users, :social_url, :string
    add_column :users, :picture_url, :string
    add_column :users, :gender, :string
    add_column :users, :birthday, :string
    add_column :users, :locale, :string
    add_column :users, :location, :string
  end
end
