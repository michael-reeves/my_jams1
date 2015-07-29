require 'rails_helper'

feature User, type: :feature do

  let(:user) do
    User.create( first_name: 'Chip', last_name: 'Foos',
                 username: 'cfoos', password: 'aaaa')
  end

  context "#show" do

    before do
      user.songs.create(title: 'First Song', artist: 'Bob Brown')
      user.songs.create(title: 'Second Song', artist: 'Dr. Dre')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user.id)
    end

    it "displays the users' name" do
      expect(page).to have_content 'Chip Foos'
    end

    it "displays a list of the user's songs" do
      expect(page).to have_selector('li', 'First Song')
      expect(page).to have_selector('li', 'Second Song')
    end

  end

end
