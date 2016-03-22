class AddVendorToUser < ActiveRecord::Migration
  def change
    add_reference :users, :vendor, index: true, foreign_key: true
  end
end
