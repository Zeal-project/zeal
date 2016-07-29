module HrSys::RecruitHelper
  def side_bar_link(action, icon, name)
    ('<li ' + active?(params, action) +
        '><a href="' + action + '"
            ><i class="' + icon + '"></i>
            <span class="menu-text">' + name + '</span>
            <span class="selected"></span>
        </a>
    </li>').html_safe
  end

  def active?(params, action)
    return 'class="active"' if params.values.second == action.split('.').first
    ""
  end
end
