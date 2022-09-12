require 'rails_helper'

RSpec.describe "Mechanic Index Page" do
  describe 'As a user' do
    describe 'I visit the mechanics index page' do
      it 'I see a header saying “All Mechanics”' do
        visit '/mechanics'

        expect(page).to have_content("All Mechanics")
      end

      it 'I see a list of all mechanics names and their years of experience' do
        @bob = Mechanic.create!(name: "Bob", years_experience: 8)
        @jim = Mechanic.create!(name: "Jimmy", years_experience: 9)
        @joe = Mechanic.create!(name: "Joe", years_experience: 10)

        visit '/mechanics'

        within('#mechanics') do
          expect(page).to have_content("Bob - years of expreience: 8")
          expect(page).to have_content("Jimmy - years of expreience: 9")
          expect(page).to have_content("Joe - years of expreience: 10")
        end
      end
      it 'I see the average years of experience across all mechanics' do
        @bob = Mechanic.create!(name: "Bob", years_experience: 8)
        @jim = Mechanic.create!(name: "Jimmy", years_experience: 9)
        @joe = Mechanic.create!(name: "Joe", years_experience: 10)

        visit '/mechanics'

        expect(page).to have_content("Average Years Experience: 9")
      end
    end
  end
end