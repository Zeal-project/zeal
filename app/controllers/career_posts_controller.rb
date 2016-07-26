class CareerPostsController < ApplicationController
	before_action :authenticate_user!, :only => [:fav, :un_fav, :recommend]
	before_action :set_career_post, :only => [:show, :fav, :un_fav, :recommend]

	def index
		@career_posts = CareerPost.order('updated_at desc').page(params[:page]).per(10)
	end

	def show
	end

	def fav
		current_user.fav_career_post( @career_post )
		redirect_to :back
	end

	def recommend
		@user = current_user
		UserMailer.recommend_career_post_email( @career_post, @user ).deliver_now!
		redirect_to :back
	end

	def un_fav
		current_user.un_fav_career_post( @career_post )
		redirect_to :back
	end

private

	def set_career_post
		@career_post = CareerPost.find(params[:id])
	end

end

	