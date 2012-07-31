class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :user
      t.string :text
      t.belongs_to :parent
      t.belongs_to :post

      t.timestamps
    end

    add_index :comments, :user_id
    add_index :comments, :parent_id
    add_index :comments, :post_id
  end
end
