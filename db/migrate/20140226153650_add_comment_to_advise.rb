class AddCommentToAdvise < ActiveRecord::Migration
  def change
    add_column :advises, :comment, :text
  end
end
