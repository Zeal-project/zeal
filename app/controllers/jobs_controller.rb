class JobsController < ApplicationController

	before_action :authenticate_user!, :except => [:index]
	before_action :set_jobs,:set_company, :only => [:new, :show, :edit, :destroy, :create]


	def index
		@jobs = Job.order('updated_at desc').page(params[:page]).per(10)
	end

	def new
		@job = Company.find(params[:company_id]).jobs.new
	end

	def create
		@job = Company.find(params[:company_id]).jobs.new( job_params )
		if @job.save
			flash[:notice] = "成功建立"
			redirect_to company_path(@company)
		else
			flash[:alert] = "所有欄位為必填"
			render :new
		end
	end

	def show
	end

	def edit
		@job = Company.find(params[:company_id]).jobs.find(params[:id])
	end

	def update
		@job = Company.find(params[:company_id]).jobs.find(params[:id])
		if @job.update( job_params )
			redirect_to company_path(params[:company_id])
		else
			render :edit
		end
	end

	def destroy
		@job = Company.find(params[:company_id]).jobs.find(params[:id])
		@job.destroy

		redirect_to company_path(@company)		
		flash[:notice] = "成功刪除"
	end



	private

	def set_jobs
		@jobs = Company.find(params[:company_id]).jobs
	end

	def set_company
		@company = Company.find(params[:company_id])
	end

	def job_params
		params.require(:job).permit(:title, :job_desc, :seniority)
	end

	def company_params
		params.require(:company).permit(:title, :intro, :address)
	end

end
