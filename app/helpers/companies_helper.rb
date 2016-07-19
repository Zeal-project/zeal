module CompaniesHelper
  def fb_share_company(company)
    '<iframe src="https://www.facebook.com/plugins/share_button.php?href=http%3A%2F%2F103.3.62.242' + '/companies/' + company.id.to_s + '%2F&layout=button&size=small&mobile_iframe=true&appId=1728317947409516&width=52&height=20" width="52" height="20" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true"></iframe>'
  end

  def fb_share_job(company, job) 
    '<iframe src="https://www.facebook.com/plugins/share_button.php?href=http%3A%2F%2F103.3.62.242' + '/companies/' + company.id.to_s + '/jobs/' + job.id.to_s + '%2F&layout=button&size=small&mobile_iframe=true&appId=1728317947409516&width=52&height=20" width="52" height="20" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true"></iframe>'
  end
end
