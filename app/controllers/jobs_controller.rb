class JobsController < ApplicationController

	def index
		@jobs = Job.all
	end

	def show
		@job = Job.find(params[:id])
	end

	def new
		@job = Job.new
	end

	def create
		@job = Job.new(params[:job])

		if @job.save
			redirect_to job_path(@job)
		else
			render :action => :new
		end
	end

	private

	def set_jobs
		@job = Job.find(params[:id])
	end

	def job_params
		params.require(:job).permit(:title, :job_desc, :seniority)
	end

end
