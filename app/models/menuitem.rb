class Menuitem < ActiveRecord::Base
  validates :name, presence: true
  validates :price, presence: true
  validates :diet_type, presence: true
  belongs_to :menu
  has_many :orderitems

  def description_method
    return " #{self.name}" if self.description == "" || self.description == nil
    self.description
  end

  def self.vegetarian
    all.where("diet_type = ?", "veg")
  end

  def self.nonvegetarian
    all.where("diet_type = ?", "nonveg")
  end
end
