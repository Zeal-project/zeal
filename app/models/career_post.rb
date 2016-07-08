class CareerPost < ApplicationRecord

	validates_presence_of :title, :content

end
