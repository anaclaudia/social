class User < ApplicationRecord

  validates(:firstname, presence: true, length: { maximum: 15 })
  validates(:lastname, presence: true, length: { maximum: 20 })
  validates(:password, presence: true, length: { minimum: 6 })
  validates(:password_confirmation, presence: true)
  validates(:password, confirmation: true)
  validates(:website, presence: true)

  has_secure_password
end
