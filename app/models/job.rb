class Job < ApplicationRecord

	validates_presence_of :title
  validates_presence_of :job_desc
  validates_presence_of :seniority

  belongs_to :company
   
end
