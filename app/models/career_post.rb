class CareerPost < ApplicationRecord

	validates_presence_of :title, :content

	belongs_to :user

	has_many :user_fav_career_posts
  has_many :fav_users, through: :user_fav_career_posts, source: :user

end
