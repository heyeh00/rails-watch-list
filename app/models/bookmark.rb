class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :comment, length: { minimum: 6 }, presence: true
  validates :list, presence: true
  validates :movie_id, presence: true, uniqueness: { scope: :list, message: ' is already on the list!' }
end
