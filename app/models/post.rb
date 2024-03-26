class Post < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :photo, :title, :description, :user_id, presence: true
  acts_as_votable
end
