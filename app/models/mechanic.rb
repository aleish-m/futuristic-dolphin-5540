class Mechanic <ApplicationRecord 
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  def self.average_exp
    average(:years_experience)
  end

  def open_rides
    rides.where(open: true)
  end
end