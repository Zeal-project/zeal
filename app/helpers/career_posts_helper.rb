module CareerPostsHelper
	def fb_share_career_post(career_post)
    '<iframe src="https://www.facebook.com/plugins/share_button.php?href=http%3A%2F%2F103.3.62.242' + '/career_posts/' + career_post.id.to_s + '%2F&layout=button&size=small&mobile_iframe=true&appId=1728317947409516&width=52&height=20" width="52" height="20" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true"></iframe>'
  end
end
