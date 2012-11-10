class AddAttachmentFileToMedia < ActiveRecord::Migration
  def self.up
    change_table :media do |t|
      t.has_attached_file :file
    end
  end

  def self.down
    drop_attached_file :media, :file
  end
end
