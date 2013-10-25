class ChangeDescriptiontypeInAdvise < ActiveRecord::Migration
  def change
    change_column :advises, :description, :text
  end
end
