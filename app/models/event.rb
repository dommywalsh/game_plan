class Event < ApplicationRecord
  # acts_as_mappable
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  belongs_to :game
  has_many :players
  has_many :messages, dependent: :destroy
  has_many :users, through: :players do
    def accepted
      where("players.status = 1")
    end
  end

  has_one_attached :photo

  include PgSearch::Model
    pg_search_scope :search_by_address,
    against: :address,
    using: {
      tsearch: { prefix: true }
  }

  def owner?(user)
    self.user == user
  end

  def endable?
    DateTime.now > self.date
  end

  def participants
    self.players.map do |player|
      player.user.email
    end
  end

  # def pending_users
  #   pending_players = self.players.pending
  #   pending_players.map(&:user)
  # end
end
