class User < ApplicationRecord
  validates :text, length: { maximum: 100 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
