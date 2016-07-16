class JobsController < ApplicationController

	before_action :authenticate_user!, :except => [:index]
	before_action :set_jobs,:set_company, :only => [:show]

	def index
		@jobs = Job.order('updated_at desc').page(params[:page]).per(10)
	end

	def show
	end

	private

	def set_jobs
		@jobs = Company.find(params[:company_id]).jobs
	end

	def set_company
		@company = Company.find(params[:company_id])
	end

end
