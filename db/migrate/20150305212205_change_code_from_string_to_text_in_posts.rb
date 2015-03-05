class ChangeCodeFromStringToTextInPosts < ActiveRecord::Migration
  def change
    change_column :posts, :code, :text
  end
end
