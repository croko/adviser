class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.string :nickname

      t.timestamps
    end
  end
end
