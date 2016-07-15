class CompaniesController < ApplicationController
	before_action :authenticate_user!, :except => [:index]
	before_action :set_companies, :only => [:show]

	def index
		@companies = Company.order('updated_at desc').page(params[:page]).per(10)
	end

	def show
		@jobs = Company.find(params[:id]).jobs
	end

	private

	def set_companies
		@company = Company.find(params[:id])
	end

	def company_params
		params.require(:company).permit(:title, :intro, :address)
	end

end
