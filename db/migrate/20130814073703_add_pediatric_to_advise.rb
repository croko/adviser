class AddPediatricToAdvise < ActiveRecord::Migration
  def change
    add_column :advises, :pediatric, :boolean, default: false
  end
end
