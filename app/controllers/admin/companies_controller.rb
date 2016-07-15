class Admin::CompaniesController < ApplicationController
	before_action :authenticate_user!, :except => [:index]
	before_action :set_companies, :only => [:show, :edit, :update, :destroy]

	layout "admin"

	def index
		@companies = Company.order('updated_at desc').page(params[:page]).per(10)
	end

	def new
		@company = Company.new
	end

	def create
		@company = Company.new( company_params )
		@company.user = current_user
		if @company.save
			flash[:notice] = "成功建立"
			redirect_to admin_company_path(@company)
		else
			flash[:alert] = "所有欄位為必填"
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		if @company.update( company_params )
			redirect_to admin_company_path(@company)
		else
			render :edit
		end
	end

	def destroy
		@company.destroy

		redirect_to admin_companies_path
		flash[:notice] = "成功刪除"
	end

	private

	def set_companies
		@company = Company.find(params[:id])
	end

	def company_params
		params.require(:company).permit(:title, :intro, :address)
	end
end
