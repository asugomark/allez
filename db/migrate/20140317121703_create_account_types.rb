class CreateAccountTypes < ActiveRecord::Migration
  def change
    create_table :account_types do |t|
      t.string :name
      t.string :code
      t.boolean :is_active

      t.timestamps
    end
  end
end
