class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics

  def self.ride_names
    pluck(:name)
  end

  def self.order_by_thrill
    order(thrill_rating: :desc)
  end
end