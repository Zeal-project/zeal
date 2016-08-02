class CompaniesController < ApplicationController
	before_action :authenticate_user!, :only => [:fav, :un_fav]
	before_action :set_company, :only => [:show, :fav, :un_fav, :comments, :write_comment]

	def index
		@companies = Company.order('updated_at desc').page(params[:page]).per(10)
	end

	def show
		@view_history.add_company(params[:id])
		session["my_view_history"] = @view_history.serialize
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

	def comments
		@comment = Comment.new
	end

	def write_comment
		@company.comments.create( content: params[:comment]["content"] )
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
