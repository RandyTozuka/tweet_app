class User < ApplicationRecord
  has_many :tweets
  has_many :likes
  validates :text, length: { maximum: 100 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
