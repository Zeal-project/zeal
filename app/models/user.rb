class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :career_posts

  has_many :companies
  has_many :user_fav_companies
  has_many :fav_companies, through: :user_fav_companies, source: :company

  has_many :resumes

  has_many :user_fav_jobs
  has_many :fav_jobs, through: :user_fav_jobs, source: :job

	def self.from_omniauth(auth)
		# Case 1: Find existing user by facebook uid
		user = User.find_by_fb_uid( auth.uid )
		if user
		  user.fb_token = auth.credentials.token
		  #user.fb_raw_data = auth
		  user.save!
		 return user
		end

		# Case 2: Find existing user by email
		existing_user = User.find_by_email( auth.info.email )
		if existing_user
		 existing_user.fb_uid = auth.uid
		 existing_user.fb_token = auth.credentials.token
		 #existing_user.fb_raw_data = auth
		 existing_user.save!
		 return existing_user
		end

		# Case 3: Create new password
		user = User.new
		user.fb_uid = auth.uid
		user.fb_token = auth.credentials.token
		user.email = auth.info.email
		user.password = Devise.friendly_token[0,20]
		#user.fb_raw_data = auth
		user.save!
		return user
	end

	def resume
		self.resumes.last
	end

  def resume_attachment
    self.resumes.where.not( resume_attachment_file_name: nil ).last.resume_attachment.url
  end

  def has_faved_the_company?(company)
    self.fav_company_ids.include?(company.id)
  end

  def fav_company(company, user)
    UserFavCompany.create( company: company, user: user )
  end

  def un_fav_company(company, user)
    fav = UserFavCompany.find_by( company: company, user: user )
    fav.destroy
  end

end
