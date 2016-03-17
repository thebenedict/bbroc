class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.references :request, index: true, foreign_key: true
      t.references :post, index: true, foreign_key: true
      t.integer :weight

      t.timestamps null: false
    end
  end
end
