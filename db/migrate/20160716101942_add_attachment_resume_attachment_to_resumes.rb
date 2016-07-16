class AddAttachmentResumeAttachmentToResumes < ActiveRecord::Migration
  def self.up
    change_table :resumes do |t|
      t.attachment :resume_attachment
    end
  end

  def self.down
    remove_attachment :resumes, :resume_attachment
  end
end
