class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, :last_name, :password, presence:true
  validates :username, presence: true, uniqueness: true

  def full_name
    "#{first_name} #{last_name}"
  end

end
