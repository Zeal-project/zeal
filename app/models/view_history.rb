class ViewHistory
  attr_reader :view_history

	def initialize(view_history = [])
	 @view_history = view_history
	end

	def add_job(company_id, job_id)
    job = view_history.select{ |job| (job.company_id == company_id) && (job.id == job_id ) }

	  @view_history << ViewJob.new(company_id, job_id) if job.empty?
	end

  def add_company(company_id)
    company = view_history.select{ |company| (company.company_id == company_id) && (company.id == nil ) }

    @view_history << ViewCompany.new(company_id) if company.empty?
  end

	def serialize
    result = view_history.map { |job| {"company_id" => job.company_id,
                                    "job_id" => job.id} }

    { "view_history" => result }
  end

  def self.build_from_hash(hash)
    all_jobs = []
    if hash && hash["view_history"]
      all_jobs = hash["view_history"].map {|job| ViewJob.new(job["company_id"], job["job_id"])}
    end
    new all_jobs
  end
end


