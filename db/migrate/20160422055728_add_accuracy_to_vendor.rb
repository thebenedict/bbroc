class AddAccuracyToVendor < ActiveRecord::Migration
  def change
    add_column :vendors, :accuracy, :integer
    add_column :vendors, :user_submitted, :boolean, null: false, default: false
  end
end
