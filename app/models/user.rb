class User < ApplicationRecord

  validates(:firstname, presence: true, length: { maximum: 15 })
  validates(:lastname, presence: true, length: { maximum: 20 })

  has_secure_password
end
