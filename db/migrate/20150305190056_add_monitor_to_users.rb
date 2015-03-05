class AddMonitorToUsers < ActiveRecord::Migration
  def change
    add_column :users, :monitor, :boolean, null: false, default: false
  end
end
