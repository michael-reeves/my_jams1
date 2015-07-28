require 'rails_helper'

feature "a user", type: :feature do

  let(:user) do
    user = User.new( first_name: 'Richard', last_name: 'Foo',
                     username: 'rfoo', password: 'aaaaa' )
  end

  it "can create an account" do
    visit new_user_path

    expect(current_path).to eq new_user_path
    expect(page).to have_content 'Create a New Account'

    page.fill_in 'First name', with: user.first_name
    page.fill_in 'Last name',  with: user.last_name
    page.fill_in 'Username',   with: user.username
    page.fill_in 'Password',   with: user.password
    page.click_button 'Create Account'

    expect(current_path).to eq user_path(1)
  end

  it "can login" do
    user.save
  end

end
