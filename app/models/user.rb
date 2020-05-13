class User < ActiveRecord::Base
  has_secure_password
  has_many :orders
  validates :name, presence: true

  def self.customers
    where("role = ?", "customer")
  end
  def self.clerks
    where("role = ?", "clerk")
  end
end
