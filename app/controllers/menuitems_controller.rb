class MenuitemsController < ApplicationController
  def index
  end

  def create
    ensure_owner_logged_in
    menu = Menu.find(params[:id])
    new_menuitem = menu.menuitems.new(name: params[:name],
                                      description: params[:description],
                                      price: params[:price],
                                      diet_type: params[:diet_type],
                                      imageurl: params[:imageurl])
    if new_menuitem.save
      flash[:success] = "#{params[:name]} added to #{menu.name} menu!"
      if @menu == menu
        redirect_to menus_path
      else
        redirect_to menus_edit_path(menu_id: menu.id)
      end
    else
      flash[:error] = new_menuitem.errors.full_messages.join(", ")
      if @menu == menu
        redirect_to menus_path
      else
        redirect_to menus_edit_path(menu_id: menu.id)
      end
    end
  end

  def destroy
    menuitem = Menuitem.find(params[:id])
    menu = menuitem.menu
    name = menuitem.name
    menuitem.destroy
    flash[:success] = "Menuitem- #{name} deleted successfully!"
    if @menu == menu
      redirect_to menus_path
    else
      redirect_to menus_edit_path(menu_id: menu.id)
    end
  end

  def edit
    menuitem = Menuitem.find(params[:id])
    render :edit, locals: { menuitem: menuitem }
  end

  def update
    menuitem = Menuitem.find(params[:id])
    menuitem.name = params[:name].presence || menuitem.name
    menuitem.description = params[:description].presence || menuitem.description
    menuitem.price = params[:price].presence || menuitem.price
    menuitem.diet_type = params[:diet_type].presence || menuitem.diet_type
    menuitem.imageurl = params[:imageurl].presence || menuitem.imageurl
    menuitem.save
    if @menu == menuitem.menu
      redirect_to menus_path
    else
      redirect_to menus_edit_path(menu_id: menu.id)
    end
  end
end
