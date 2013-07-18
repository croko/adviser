class AddNameToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :role_id, :integer
    add_column :admin_users, :name, :string
    add_column :admin_users, :last_name, :string
  end
end
