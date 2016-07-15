class Company < ApplicationRecord
	validates_presence_of :title, :intro, :address

	belongs_to :user

	has_many :jobs, dependent: :destroy

end
