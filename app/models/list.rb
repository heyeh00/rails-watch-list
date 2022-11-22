class List < ApplicationRecord
  has_many :movies, through: :bookmarks
  has_many :bookmarks
  has_one_attached :image
  validates :name, presence: true
  validates :name, uniqueness: true
end
