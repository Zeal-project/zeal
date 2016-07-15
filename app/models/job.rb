class Job < ApplicationRecord

	validates_presence_of :title, :job_desc, :seniority

  belongs_to :company
   
end
