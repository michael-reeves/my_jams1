require 'rails_helper'

feature 'authorization' do


  context 'as admin user' do
    let(:admin_user) do
      User.create( first_name: 'Rich', last_name: 'Foo',
                   username: "rfoo", password: 'aaaa',
                   role: 'poohbah' )
    end

    scenario 'can login' do
      visit login_path

      page.fill_in 'Username', with: admin_user.username
      page.fill_in 'Password', with: 'aaaa'
      click_button 'Login'
      expect(page).to have_content('Login succeeded....')
    end

    scenario 'can access all users while logged in' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin_user)

      visit admin_users_path
      expect(page).to have_content 'All Users'
    end

    
  end

  context 'as regular user' do
    let(:admin_user) do
      User.create( first_name: 'Rich', last_name: 'Foo',
                   username: "rfoo", password: 'aaaa',
                   role: 'default' )
    end

    scenario 'cannot access all users while logged in' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin_user)

      visit admin_users_path
      expect(page).to have_content "The page you were looking for doesn't exist."
    end
  end

end
