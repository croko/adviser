class AddPromoToDoctor < ActiveRecord::Migration
  def change
    add_column :doctors, :end_promo, :date
  end
end
