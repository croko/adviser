class AddPromoToClinic < ActiveRecord::Migration
  def change
    add_column :clinics, :end_promo, :date
  end
end
