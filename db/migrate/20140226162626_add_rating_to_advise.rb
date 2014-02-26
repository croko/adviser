class AddRatingToAdvise < ActiveRecord::Migration
  def change
    add_column :advises, :rating, :integer, default: 0
  end
end
