class MenuApplicationController < ActionController::Base
  before_action :ensure_menu_opened

  def ensure_menu_opened
    unless current_menu
      redirect_to "/menu"
    end
  end

  def current_menu
    return @current_menu if @current_menu

    current_menu_id = session[:current_menu_id]
    if current_menu_id
      @current_menu = Menu.find(current_menu_id)
    else
      nil
    end
  end
end
