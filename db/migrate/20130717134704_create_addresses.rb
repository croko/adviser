class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :phone_number
      t.string :mobile_phone_number
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip_code
      t.integer :addressable_id
      t.string :addressable_type
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
