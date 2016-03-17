class AddNotifiedAtToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :notified_at, :datetime
  end
end
