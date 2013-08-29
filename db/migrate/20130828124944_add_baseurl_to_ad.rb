class AddBaseurlToAd < ActiveRecord::Migration
  def change
    add_column :ads, :baseurl, :string
  end
end
