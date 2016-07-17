class Admin::CareerPostsController < ApplicationController
	before_action :authenticate_user!, :except => [:index]
	before_action :set_career_posts, :only => [:show, :edit, :update, :destroy]

	layout "admin"

	def index
		@career_posts = CareerPost.order('updated_at desc').page(params[:page]).per(10)
	end

	def new
		@career_post = CareerPost.new
	end

	def create
		@career_post = CareerPost.new( career_post_params )
		@career_post.user = current_user
		if @career_post.save
			flash[:notice] = "成功建立"
			redirect_to admin_career_post_path(@career_post)
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
		if @career_post.update( career_post_params )
			redirect_to admin_career_post_path(@career_post)
		else
			render :edit
		end
	end

	def destroy
		@career_post.destroy

		redirect_to admin_career_posts_path
		flash[:notice] = "成功刪除"
	end

	private

	def set_career_posts
		@career_post = CareerPost.find(params[:id])
	end

	def career_post_params
		params.require(:career_post).permit(:title, :content)
	end
end
