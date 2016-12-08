class User < ApplicationRecord
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy

  before_save { self.website = website.downcase }

  validates(:firstname, presence: true, length: { maximum: 15 })
  validates(:lastname, presence: true, length: { maximum: 20 })
  validates(:password, presence: true, length: { minimum: 6 })
  validates(:password_confirmation, presence: true)
  validates(:password, confirmation: true)
  validates(:website, presence: true)

  has_secure_password

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

end
