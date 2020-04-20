class Menu < ActiveRecord::Base
  validates :name, presence: true
  has_many :menuitems
end
