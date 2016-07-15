class CareerPostsController < ApplicationController

	before_action :authenticate_user!, :except => [:index]
	before_action :set_career_posts, :only => [:show]

	def index
		@career_posts = CareerPost.order('updated_at desc').page(params[:page]).per(10)
	end

	def show
	end

private

	def set_career_posts
		@career_post = CareerPost.find(params[:id])
	end

	