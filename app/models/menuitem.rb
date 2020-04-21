class Menuitem < ActiveRecord::Base
  validates :name, presence: true
  validates :price, presence: true
  validates :diet_type, presence: true
  belongs_to :menu

  def self.of_menu(menu)
    all.where(menu_id: menu.id)
  end

  def self.vegetarian
    all.where("diet_type = ?", "veg")
  end

  def self.nonvegetarian
    all.where("diet_type = ?", "nonveg")
  end
end
