class Job < ApplicationRecord

	validates_presence_of :title, :job_desc, :seniority

  belongs_to :company
   
  has_many :user_fav_jobs
  has_many :fav_users, through: :user_fav_jobs, source: :user

end
