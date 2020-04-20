class Menuitem < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true

  belongs_to :menu

  def self.of_menu(menu)
    all.where(menu_id: menu.id)
  end
end
