class JobsController < ApplicationController

	before_action :authenticate_user!, :except => [:index]
	before_action :set_jobs, :set_company, :only => [:show]
	before_action :set_job, :only => [:fav, :un_fav]

	def index
		@jobs = Job.order('updated_at desc').page(params[:page]).per(10)
	end

	def show
		redirect_to job_in_company
	end

	def fav
		@view_history.add_job(params[:company_id], params[:id])
		session["my_view_history"] = @view_history.serialize
		current_user.fav_job(@job)
		redirect_to :back
	end

	def un_fav
		current_user.un_fav_job(@job)
		redirect_to :back
	end

	private

	def job_in_company
		company_path(params[:company_id]) + "#" + (params[:id])
	end

	def set_job
		@job = Job.find_by( company_id: params[:company_id], id: params[:id] )
	end

	def set_jobs
		@jobs = Company.find(params[:company_id]).jobs
	end

	def set_company
		@company = Company.find(params[:company_id])
	end
end
