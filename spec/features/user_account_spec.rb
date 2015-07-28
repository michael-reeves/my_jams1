require 'rails_helper'

feature "a user", type: :feature do

  it "can create an account" do
    visit new_user_path

    expect(current_path).to eq new_user_path
    expect(page).to have_content 'Create a New Account'

    page.fill_in 'First name', with: 'Richard'
    page.fill_in 'Last name',  with: 'Foo'
    page.fill_in 'Username',   with: 'rfoo'
    page.fill_in 'Password',   with: 'aaaaa'
    page.click_button 'Create Account'

    expect(current_path).to eq user_path(1)
  end

end
