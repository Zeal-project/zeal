class UserFavCareerPost < ApplicationRecord

	belongs_to :user
	belongs_to :career_post

end
