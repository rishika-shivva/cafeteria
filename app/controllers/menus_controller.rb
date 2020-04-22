class MenusController < MenuApplicationController
  skip_before_action :ensure_menu_opened

  def index
    render "menus/new"
  end

  def new
    render "menus/new"
  end

  def create
    new_menu = Menu.new(name: params[:name])
    if new_menu.save
      redirect_to new_menusessions_path
      flash[:notice] = "Please Enter Menu name to be displayed"
    else
      flash[:error] = new_menu.errors.full_messages.join(", ")
      redirect_to menus_path
    end
  end
end
