class User < ApplicationRecord

#  attr_accessor :firstname, :lastname, :website

  validates(:firstname, presence: true, length: { maximum: 15 })
  validates(:lastname, presence: true, length: { maximum: 20 })

end
