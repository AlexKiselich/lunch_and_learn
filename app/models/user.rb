class User < ApplicationRecord
  validates_presence_of :name
  validates :email, presence: true, uniqueness: true
  validates_presence_of :password_digest

  has_secure_password
end
