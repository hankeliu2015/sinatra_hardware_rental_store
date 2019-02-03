class Customer < ActiveRecord::Base
  has_secure_password
  has_many :tools
  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true

  def self.find_by_username_or_email(username_or_email)
    self.find_by(username: username_or_email) || self.find_by(email: username_or_email)
  end
end
