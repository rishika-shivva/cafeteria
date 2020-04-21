class MenuitemsController < ApplicationController
  def index
    @menuitems = current_menu.menuitems
    render "index"
  end

  def show
    id = params[:id]
    menuitem = current_menu.menuitems.find(id)
    render "menuitem"
  end

  def create
    new_menuitem = Menuitem.new(
      name: params[:name],
      description: params[:description],
      price: params[:price],
      menu_id: current_menu.id,
    )
    if new_menuitem.save
      redirect_to menuitems_path
    else
      flash[:error] = new_menuitem.errors.full_messages.join(", ")
      redirect_to menuitems_path
    end
  end

  def update
    id = params[:id]
    menuitem = current_menu.menuitems.find(id)
    menuitem.name = name
    menuitem.description = description
    menuitem.price = price
    menuitem.save!
    redirect_to menuitems_path
  end

  def destroy
    id = params[:id]
    menuitem = current_menu.menuitems.find(id)
    menuitem.destroy
    redirect_to menuitems_path
  end
end
