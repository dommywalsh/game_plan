class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_ratings
  has_many :players
  has_many :events
  has_one_attached :photo

  after_create :create_user_ratings

  INITIAL_RATING = 1500

  def create_user_ratings
    Game.all.each do |game|
      UserRating.create(game: game, user: self, rating: INITIAL_RATING)
    end
  end

  def accepted_events
    self.players.select { |player| player.status == "confirmed" }
  end

  def pending_events
    self.players.select { |player| player.status == "pending" }
  end

end
