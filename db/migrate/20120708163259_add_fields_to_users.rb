class AddFieldsToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :nickname
      t.string :jabber
      t.string :city
      t.text :distributions
      t.text :interests
    end

    add_index :users, :nickname, :unique => true
  end
end
