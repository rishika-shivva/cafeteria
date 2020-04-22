class User < ApplicationRecord
  validates :name, presence: true
  validates :role, presence: true
  has_secure_password
end
