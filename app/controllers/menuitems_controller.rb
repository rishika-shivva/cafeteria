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
    name = params[:name]
    description = params[:description]
    price = params[:price]
    new_menuitem = menuitems.new(
      name: name,
      description: description,
      price: price,
      menu_id: current_menu.id,
    )
  end

  def update
    id = params[:id]
    menuitem = current_menu.menuitems.find(id)
    menuitem.name = name
    menuitem.description = description
    menuitem.price = price
    menuitem.save!
  end

  def destroy
    id = params[:id]
    menuitem = current_menu.menuitems.find(id)
    menuitem.destroy
  end
end
