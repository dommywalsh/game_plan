class UserRating < ApplicationRecord
  belongs_to :game
  belongs_to :user

  def increment_first_place_score!
    self.rating += self.game.first_place_points
    self.save
  end

  def increment_second_place_score!
    self.rating += self.game.second_place_points
    self.save
  end

  def increment_losing_scores!
    self.rating += self.game.losing_points
    self.save
  end
end
