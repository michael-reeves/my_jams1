class User < ActiveRecord::Base
  has_many :songs
  has_secure_password

  validates :first_name, :last_name, :password, presence:true
  validates :username, presence: true, uniqueness: true

  enum role: %w{ default poohbah }
  
  def full_name
    "#{first_name} #{last_name}"
  end

end
