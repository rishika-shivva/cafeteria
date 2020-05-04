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
      redirect_to menuitems_path
    else
      flash[:error] = new_menu.errors.full_messages.join(", ")
      redirect_to menus_path
    end
  end

  def show
    @menu = Menu.find(params[:id])
    @menuitems = @menu.menuitems
  end

  def edit
    @menu = Menu.find(params[:id])
    @menuitems = @menu.menuitems
  end
end
