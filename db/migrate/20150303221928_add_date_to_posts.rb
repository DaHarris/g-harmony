class AddDateToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :timestamp_field, :datetime
  end
end
