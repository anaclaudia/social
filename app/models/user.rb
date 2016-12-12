class User < ApplicationRecord
  
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  before_save :downcase_website!

  validates(:firstname, presence: true, length: { maximum: 15 })
  validates(:lastname, presence: true, length: { maximum: 20 })
  validates(:password, presence: true, length: { minimum: 6 })
  validates(:password_confirmation, presence: true)
  validates(:password, confirmation: true)
  validates(:website, presence: true)

  has_secure_password

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def follow(some_user)
    active_relationships.create(followed_id: some_user.id)
  end

  def unfollow(some_user)
    active_relationships.find_by(followed_id: some_user.id).destroy
  end

  def following?(some_user)
    following.include?(some_user)
  end
  
  private
  
  def downcase_website!
    self.website = website.downcase
  end
end
