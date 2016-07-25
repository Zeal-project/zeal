module ApplicationHelper
  def badge(content)
    '<span class="badge pull-right">' + content.to_s + '</span>'
  end

end
