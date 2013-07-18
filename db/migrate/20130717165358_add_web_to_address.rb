class AddWebToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :website_url, :string
  end
end
