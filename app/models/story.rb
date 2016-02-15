class PlaceValidator < ActiveModel::Validator
  # Checks city and state against the cities and states in the city-state gem.
  def validate(record)
    if !CS.states(:us).keys.map(&:to_s).include? record.state
      record.errors[:base] << "We don't have that state."
    elsif !CS.cities(record.state, :us).include? record.city
      record.errors[:base] << "Can't find that city in that state."
    end
  end
end

class Story < ApplicationRecord
  # The Story is the foundational model of I Can't Vote.
  validates :body, presence: { message: "Tell us your story." },
                   length: { minimum: 13 } # Characters in I can't vote!
  validates_with PlaceValidator

  # Find by state and (optional) city -
  # e.g. Story.only_from("NJ"), Story.only_from("NJ", "Trenton")
  scope :only_from, lambda { | state_key, city = nil |
    if !city.nil?
      where(state: state_key, city: city)
    else
      where(state: state_key)
    end
  }
end
