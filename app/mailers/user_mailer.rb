class UserMailer < ApplicationMailer
	default :from => "zealor.tw@gmail.com"
	
	def recommend_career_post_email(career_post, user)
  	@user = user
  	@url  = 'http://103.3.62.242/'+'career_posts/'+ career_post.id.to_s
  	#@url  = 'http://localhost:3000/'+'career_posts/'+ career_post.id.to_s
  	mail( subject: '推薦你一篇好文章！', bcc: "zealor.tw@gmail.com" )
  end

end

