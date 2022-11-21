class Movie < ApplicationRecord
  has_many :bookmarks
  belongs_to :list
end
