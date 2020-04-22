class MenuhomeController < MenuApplicationController
  skip_before_action :ensure_menu_opened

  def index
    if current_menu
      redirect_to menuitems_path
    else
      render "index"
    end
  end
end
