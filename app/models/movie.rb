class Movie < ApplicationRecord
  has_many :lists, through: :bookmarks
  has_many :bookmarks
  validates :title, :overview, uniqueness: true
  validates :title, :overview, :poster_url, :rating, presence: true
end
