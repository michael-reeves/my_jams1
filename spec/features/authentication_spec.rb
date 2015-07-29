require 'rails_helper'

feature 'user', type: :feature do

  context 'who is registered' do
    let(:user) do
      user = User.new( first_name: 'Richard', last_name: 'Foo',
                       username: 'rfoo', password: 'aaaaa' )
    end

    before {
      user.save
    }

    it "can login" do
      visit login_path

      expect(current_path).to eq login_path
      expect(page).to have_content 'Login'

      page.fill_in 'Username', with: user.username
      page.fill_in 'Password', with: 'aaaaa'
      page.click_button 'Login'

      expect(current_path).to eq user_path(1)
      expect(page).to have_content("Login succeeded....")
    end

    it "can logout" do
      # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit login_path
      page.fill_in 'Username', with: user.username
      page.fill_in 'Password', with: 'aaaaa'
      page.click_button 'Login'

      visit user_path(user.id)
      # save_and_open_page
      expect(current_path).to eq user_path(1)
      expect(page).to have_content('Logged in as rfoo')

      click_link 'Logout'
      expect(page).to have_content('You are now logged out.')
      expect(page).to have_content('My Jams')
      expect(page).to have_content('Create Account')
      expect(page).to have_content('Login')
    end

  end

end
