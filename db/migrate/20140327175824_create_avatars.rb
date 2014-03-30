class CreateAvatars < ActiveRecord::Migration
  def change
    create_table :avatars do |t|
      t.references :user, index: true

      t.timestamps
    end
  end
end
