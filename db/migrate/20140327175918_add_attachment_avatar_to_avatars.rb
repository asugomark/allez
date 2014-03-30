class AddAttachmentAvatarToAvatars < ActiveRecord::Migration
  def self.up
    change_table :avatars do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :avatars, :avatar
  end
end
