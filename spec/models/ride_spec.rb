require 'rails_helper'

RSpec.describe Ride, type: :model do
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it { should have_many(:ride_mechanics) }
    it { should have_many(:mechanics).through(:ride_mechanics) } 
  end

  describe 'class methods' do
    before :each do
      @bob = Mechanic.create!(name: "Bob", years_experience: 8)
      
      @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)

      @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 8, open: true)
      @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
      @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

      @bob_hurler = RideMechanic.create!(mechanic_id: @bob.id, ride_id: @hurler.id)
      @bob_scrambler = RideMechanic.create!(mechanic_id: @bob.id, ride_id: @scrambler.id)
      @bob_ferris = RideMechanic.create!(mechanic_id: @bob.id, ride_id: @ferris.id)
    end

    it '#self.names' do
      expect(Ride.ride_names).to eq([@hurler.name, @scrambler.name, @ferris.name])
    end

    it 'self.order_by_thrill' do
      expect(Ride.order_by_thrill).to eq([@hurler, @ferris, @scrambler])
    end
  end
end