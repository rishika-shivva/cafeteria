class MenuhomeController < MenuapplicationController
  skip_before_action :ensure_menu_opened

  def index
    @menus = Menu.all
    if current_menu
      redirect_to menuitems_path
    else
      render "index"
    end
  end
end
