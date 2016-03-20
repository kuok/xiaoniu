class CreateNaviMenus < ActiveRecord::Migration
  def change
    create_table :navi_menus do |t|
      t.integer :navi_menu_flag, :limit => 4, null: false

      t.timestamps null: false
    end
  end
end
