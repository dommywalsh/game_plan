class Game < ApplicationRecord
  has_many :user_ratings
  has_many :events
end
