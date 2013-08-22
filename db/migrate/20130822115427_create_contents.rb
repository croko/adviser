class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :name
      t.string :announce
      t.text :body
      t.references :page, index: true

      t.timestamps
    end
  end
end
