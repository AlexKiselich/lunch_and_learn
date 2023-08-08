class User < ApplicationRecord
  validates_presence_of :name
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true

  has_secure_password

  has_many :favorites
end
