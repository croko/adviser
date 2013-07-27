class AddPublishedToComment < ActiveRecord::Migration
  def change
    add_column :comments, :published, :boolean, default: true
    change_column :comments, :message, :string
  end
end
