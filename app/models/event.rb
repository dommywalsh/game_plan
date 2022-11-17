class Event < ApplicationRecord
  # acts_as_mappable
  validates :capacity, presence: true
  validates :game, presence: true
  validates :name, presence: true
  validates :description, presence: true, uniqueness: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  belongs_to :game
  has_many :players
  has_many :messages, dependent: :destroy
  has_many :users, through: :players do
    def confirmed
      where("players.status = 1")
    end

    def pending
      where("players.status = 0")
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

  def self.find_first_pending_player
    event = find { |e| e.players.any?(&:pending?) }
    return nil unless event

    event.players.pending.first
  end

  def self.pending_players
    Player.where(event_id: all.map(&:id)).pending
  end

  def pending_user?(user)
    self.users.pending.include? user
  end

  def confirmed_user?(user)
    self.users.confirmed.include? user
  end

  def max_capacity_reached?
    players.count >= self.capacity
  end
end
