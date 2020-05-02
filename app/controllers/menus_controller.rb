class MenusController < MenuapplicationController
  skip_before_action :ensure_menu_opened

  def index
    @menus = Menu.all
    render "menus/index"
  end

  def new
    render "menus/new"
  end

  def create
    new_menu = Menu.new(name: params[:name])
    if new_menu.save
      redirect_to new_menusessions_path
    else
      flash[:error] = new_menu.errors.full_messages.join(", ")
      redirect_to menus_path
    end
  end

  def destroy
    id = params[:id]
    menu = current_user.menus.find(id)
    menu.destroy
    redirect_to menus_path
  end
end
