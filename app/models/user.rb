class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_ratings
  has_many :players
  has_many :events
 
  after_save :set_user_ratings

  def set_user_ratings
    Game.all.each do |game|
      User
    end
  end

  # def update_first_place_rating!(game)

  # end
end
