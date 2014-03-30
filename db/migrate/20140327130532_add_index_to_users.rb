class AddIndexToUsers < ActiveRecord::Migration
  def change
    add_index :users, :slug, unique: true
  end
end
