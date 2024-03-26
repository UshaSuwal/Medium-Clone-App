class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :phone_number, presence: true, numericality: { only_integer: true, message: "is not a number" }, length: { is: 10, message: "must be 10 digits" }
  validates :name, presence: true, length: { maximum: 50 }
end
