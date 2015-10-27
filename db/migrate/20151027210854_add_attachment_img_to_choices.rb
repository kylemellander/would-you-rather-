class AddAttachmentImgToChoices < ActiveRecord::Migration
  def self.up
    change_table :choices do |t|
      t.attachment :img
    end
  end

  def self.down
    remove_attachment :choices, :img
  end
end
