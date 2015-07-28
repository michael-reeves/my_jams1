require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) do
    User.new( first_name: 'Joshman', last_name: 'Foo',
              username: 'jfoo', password: 'aaaaa' )
  end

  it 'is valid' do
    expect(user).to be_valid
  end

  context 'is invalid' do
    it 'without a first_name' do
      user.first_name = nil
      expect(user).not_to be_valid
    end

    it 'without a last_name' do
      user.last_name = nil
      expect(user).not_to be_valid
    end

    it 'without a username' do
      user.username = nil
      expect(user).not_to be_valid
    end

    it 'without a password' do
      user.password = nil
      expect(user).not_to be_valid
    end

    it "with a duplicate username" do
      user.save
      user2 = User.new( first_name: "Richard", last_name: "Bar",
                        username: 'jfoo', password: 'bbbbb'
                      )
      expect(user2).not_to be_valid
    end
  end

end
