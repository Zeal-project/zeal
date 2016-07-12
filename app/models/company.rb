class Company < ApplicationRecord
	validates_presence_of :title, :intro, :address

	belongs_to :user

end
