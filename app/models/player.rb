class Player < ApplicationRecord
  belongs_to :event
  belongs_to :user
  enum status: [:pending, :confirmed, :rejected]
end
