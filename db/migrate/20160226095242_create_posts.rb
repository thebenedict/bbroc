class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :vendor_id
      t.string :item
      t.string :notes
      t.integer :price
      t.string :unit

      t.timestamps null: false
    end
  end
end
