class Song < ActiveRecord::Base
  belongs_to :user
  validates :title, :artist, presence: true
end
