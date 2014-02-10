class AddNameToComment < ActiveRecord::Migration
  def change
    add_column :comments, :name, :string
    
    Comment.reset_column_information

    Comment.all.each do |comment|
      comment.update_column('name', comment.user.first_name)
    end
  end
end
