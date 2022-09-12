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
end