class ChangeMessageInComments < ActiveRecord::Migration
  def change
    change_column :comments, :message, :text
  end
end
