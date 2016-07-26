# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
	def recommend_career_post_email_preview
		UserMailer.recommend_career_post_email
	end
end
