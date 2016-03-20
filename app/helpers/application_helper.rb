module ApplicationHelper
  def navi_menu_flag
    NaviMenu.find(1).try(:navi_menu_flag)
  end

  def show_navi_menu?
    navi_menu_flag == 1
  end

end
