class User < ApplicationRecord

  validates(:firstname, presence: true, length: { maximum: 30 })
  validates(:lastname, presence: true, length: { maximum: 30 })

end
