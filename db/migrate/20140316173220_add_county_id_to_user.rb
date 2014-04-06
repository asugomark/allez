class AddCountyIdToUser < ActiveRecord::Migration
  def change
    add_reference :users, :county, index: true
  end
end
