class RemoveStatusFromAdvise < ActiveRecord::Migration
  def change
    remove_column :advises, :status, :string
  end
end
