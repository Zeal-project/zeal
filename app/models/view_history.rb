class ViewHistory
  attr_reader :view_jobs

	def initialize(view_jobs = [])
	 @view_jobs = view_jobs
	end

	def add_job(company_id, job_id)
    job = view_jobs.select{ |job| (job.company_id == company_id) && (job.id == job_id ) }

	  @view_jobs << ViewJob.new(company_id, job_id) if job.empty?
	end

	def serialize
    result = view_jobs.map { |job| {"company_id" => job.company_id,
                                    "job_id" => job.id} }

    { "view_jobs" => result }
  end

  def self.build_from_hash(hash)
    all_jobs = []
    if hash && hash["view_jobs"]
      all_jobs = hash["view_jobs"].map {|job| ViewJob.new(job["company_id"], job["job_id"])}
    end
    new all_jobs
  end
end


