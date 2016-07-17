class Company < ApplicationRecord
	validates_presence_of :title, :intro, :address

	belongs_to :user

  has_many :user_fav_companies
  has_many :fav_users, through: :user_fav_companies, source: :user

	has_many :jobs, dependent: :destroy

end
