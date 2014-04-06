class CreateIndustries < ActiveRecord::Migration
  def change
    create_table :industries do |t|
      t.string :name
      t.string :code
      t.boolean :is_active

      t.timestamps
    end
  end
end
