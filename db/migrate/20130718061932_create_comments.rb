class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.text :message
      t.integer :rating, default: 0
      t.string :commentable_type
      t.integer :commentable_id

      t.timestamps
    end
  end
end
