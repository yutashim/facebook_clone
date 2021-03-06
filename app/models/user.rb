class User < ApplicationRecord
  has_many :pictures
  has_secure_password
  validates :name, presence: true, length: { minimum: 5, maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: { minimum: 7 }                  
  before_validation { email.downcase! }
end
