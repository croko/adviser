class AddProcessedToAdvise < ActiveRecord::Migration
  def change
    add_column :advises, :processed, :boolean, default: false
    add_column :advises, :email_sent, :boolean, default: false
  end
end
