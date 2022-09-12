require 'rails_helper'

RSpec.describe "Mechanic Show Page" do
  describe 'As a user' do
    describe 'I visit a mechanic show page' do
      before :each do 
        @bob = Mechanic.create!(name: "Bob", years_experience: 8)
        @jim = Mechanic.create!(name: "Jimmy", years_experience: 9)

        @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)

        @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
        @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
        @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)
        @jaws = @six_flags.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

        @bob_hurler = RideMechanic.create!(mechanic_id: @bob.id, ride_id: @hurler.id)
        @bob_scrambler = RideMechanic.create!(mechanic_id: @bob.id, ride_id: @scrambler.id)
        @bob_ferris = RideMechanic.create!(mechanic_id: @bob.id, ride_id: @ferris.id)
        @jim_ferris = RideMechanic.create!(mechanic_id: @jim.id, ride_id: @ferris.id)
        @jim_jaws = RideMechanic.create!(mechanic_id: @jim.id, ride_id: @jaws.id)
      end
      it "I see their name, years of experience, and the names of rides they’re working on" do
        visit "/mechanics/#{@bob.id}"

        expect(page).to have_content("Name: Bob")
        expect(page).to have_content("Years of Experience: 8")
        expect(page).to have_content("The Hurler")
        expect(page).to have_content("The Scrambler")
        
        expect(page).to_not have_content("Name: Jimmy")
        expect(page).to_not have_content("Years of Experience: 9")
        expect(page).to_not have_content("Jaws")
      end

      it 'I see a list of all mechanics names and their years of experience' do
        visit "/mechanics/#{@bob.id}"

        expect(page).to have_content("The Hurler")
        expect(page).to have_content("The Scrambler")
        
        expect(page).to_not have_content("Ferris Wheel")
      end

      it 'the rides are listed by thrill rating in descending order (most thrills first)' do
        visit "/mechanics/#{@bob.id}"

        expect(page).to have_content("Rides being worked on: The Hurler and The Scrambler")
      end
    end
  end
end