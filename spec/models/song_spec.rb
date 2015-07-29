require 'rails_helper'

describe Song, type: :model do

  let(:song) { Song.new(title: 'My Song', artist: 'Me', user_id: 1) }

  it "is valid" do
    expect(song).to be_valid
  end

  it "is not valid without a title" do
    song.title = nil
    expect(song).to be_invalid
  end

  it "is not valid without a title" do
    song.artist = nil
    expect(song).to be_invalid
  end

  it "has a user" do
    expect(song).to respond_to :user
  end
end
