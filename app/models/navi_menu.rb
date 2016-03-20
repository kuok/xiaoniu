class NaviMenu < ActiveRecord::Base
  def self.reset_navi_menu_flag
    navi_menu = NaviMenu.find(1)
    navi_menu.navi_menu_flag = navi_menu.navi_menu_flag == 1 ? 0 : 1
    navi_menu.save
    navi_menu.navi_menu_flag
  end
end
