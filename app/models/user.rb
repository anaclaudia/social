class User < ApplicationRecord

  validates(:firstname, presence: true, lenght: { maximum: 30 })
  validates(:lastname, presence: true, lenght: { maximum: 30 })
  validates(:website, length: { maximum: 255 })

end
