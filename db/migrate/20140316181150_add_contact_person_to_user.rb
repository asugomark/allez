class AddContactPersonToUser < ActiveRecord::Migration
  def change
    add_column :users, :contact_person, :string
  end
end
