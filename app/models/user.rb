class User < ApplicationRecord
  has_one_attached :photo
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :phone_number, presence: true, numericality: { only_integer: true, message: "is not a number" }, length: { is: 10, message: "must be 10 digits" }
  validates :name, presence: true, length: { maximum: 50 }
end
