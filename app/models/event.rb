class Event < ApplicationRecord
  # acts_as_mappable
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :user
  belongs_to :game
  has_many :players
  has_many :users, through: :players
  has_one_attached :photo


  include PgSearch::Model
      pg_search_scope :search_by_address_and_date,
      against: [ :address, :date ],
      using: {
        tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }

  # include PgSearch::Model

  # acts_as_mappable lat_column_name: :latitude,
  #                  lng_column_name: :longitude

  # pg_search_scope :search_by_game_and_date,
  #             against: [ :game, :date ],
  #             using: {
  #               tsearch: { any_word: true }
  #                     }

end
