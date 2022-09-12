require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'relationships' do
     it { should have_many(:ride_mechanics) }
     it { should have_many(:rides).through(:ride_mechanics) }
  end

  describe 'class methods' do
    it '#average_exp' do
      @bob = Mechanic.create!(name: "Bob", years_experience: 8)
      @jim = Mechanic.create!(name: "Jimmy", years_experience: 9)
      @joe = Mechanic.create!(name: "Joe", years_experience: 10)

      expect(Mechanic.average_exp).to eq 9
    end
  end

  describe 'instance methods' do
    before :each do
      @bob = Mechanic.create!(name: "Bob", years_experience: 8)
      
      @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)

      @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
      @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
      @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

      @bob_hurler = RideMechanic.create!(mechanic_id: @bob.id, ride_id: @hurler.id)
      @bob_scrambler = RideMechanic.create!(mechanic_id: @bob.id, ride_id: @scrambler.id)
      @bob_ferris = RideMechanic.create!(mechanic_id: @bob.id, ride_id: @ferris.id)
    end
    
    it '#open_rides' do
      expect(@bob.open_rides).to eq([@hurler, @scrambler])
    end
  end
end