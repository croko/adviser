class AddGenderToDoctor < ActiveRecord::Migration
  def change
    add_column :doctors, :gender, :string
  end
end
