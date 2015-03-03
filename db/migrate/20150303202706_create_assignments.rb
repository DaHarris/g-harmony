class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.belongs_to :post, index: true
      t.belongs_to :tag, index: true
    end
    add_foreign_key :assignments, :posts
    add_foreign_key :assignments, :tags
  end
end
