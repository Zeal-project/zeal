class CompaniesController < ApplicationController
	before_action :authenticate_user!, :only => [:fav, :un_fav]
	before_action :set_company, :only => [:show, :fav, :un_fav]

	def index
		@companies = Company.order('updated_at desc').page(params[:page]).per(10)
	end

	def show
		@jobs = Company.find(params[:id]).jobs
	end

	def fav
		current_user.fav_company( @company )
		redirect_to :back
	end

	def un_fav
		current_user.un_fav_company( @company )
		redirect_to :back
	end

	private

	def set_company
		@company = Company.find(params[:id])
	end

	def company_params
		params.require(:company).permit(:title, :intro, :address)
	end

end
