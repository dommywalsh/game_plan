class Player < ApplicationRecord
  belongs_to :event
  belongs_to :user
  enum status: [:pending, :confirmed, :rejected]


  def self.stack_shadow
    if count == 0
      ""
    elsif count == 1
      "0 1px 1px rgba(0,0,0,0.15);"
    elsif count == 2
      "0 1px 1px rgba(0,0,0,0.15),0 10px 0 -5px #e8b548,0 10px 1px -4px rgba(0,0,0,0.15);"
    else
      "0 1px 1px rgba(0,0,0,0.15),0 10px 0 -5px #e8b548,0 10px 1px -4px rgba(0,0,0,0.15),0 20px 0 -10px #eee,0 20px 1px -9px rgba(0,0,0,0.15);"
    end
  end
end
