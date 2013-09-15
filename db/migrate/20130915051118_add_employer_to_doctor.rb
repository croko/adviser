class AddEmployerToDoctor < ActiveRecord::Migration
  def change
    add_column :doctors, :employer, :string
  end
end
