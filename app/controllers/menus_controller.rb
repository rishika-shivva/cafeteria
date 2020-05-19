class MenusController < ApplicationController
  def index
  end

  def create
    new_menu = Menu.new(name: params[:name])
    if new_menu.save
      redirect_to menus_path
    else
      flash[:error] = new_menu.errors.full_messages.join(", ")
      redirect_to menus_path
    end
  end

  def show
    @menu = Menu.find(params[:menu_id])
    render :show, locals: { menu: @menu }
  end

  def edit
    menu = Menu.find(params[:menu_id])
    render :edit, locals: { menu: menu }
  end

  def destroy
    menu = Menu.find(params[:id])
    if (menu.id == @menu.id)
      flash[:error] = "Unable to delete active Menu!"
      redirect_to menus_path
      return
    else
      name = menu.name
      menu.destroy
      flash[:success] = "Menu- #{name} deleted succesfully!"
      redirect_to menus_path
    end
  end

  def set
    Rails.cache.write("active_menu_id", params[:menu_id])
    redirect_to menus_path
  end
end
