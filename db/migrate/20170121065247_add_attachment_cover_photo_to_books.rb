class AddAttachmentCoverPhotoToBooks < ActiveRecord::Migration
  def self.up
    change_table :books do |t|
      t.attachment :cover_photo
    end
  end
  def self.down
    remove_attachment :books, :cover_photo
  end
end
