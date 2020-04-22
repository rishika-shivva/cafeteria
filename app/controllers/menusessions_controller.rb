class MenusessionsController < MenuapplicationController
  skip_before_action :ensure_menu_opened

  def new
  end

  def create
    menu = Menu.find_by(name: params[:name])
    if menu
      session[:current_menu_id] = menu.id
      redirect_to "/menu"
    else
      flash[:error] = "Specified Menu not found.Please retry."
      redirect_to new_menusessions_path
    end
  end

  def destroy
    session[:current_menu_id] = nil
    @current_menu = nil
    redirect_to "/menu"
  end
end
