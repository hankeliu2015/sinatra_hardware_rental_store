class Customer < ActiveRecord::Base
  has_secure_password
  has_many :tools
  validates :email, uniqueness: true, presence: true

  def self.find_by_username_or_email(username_email)
    self.find_by(username: username_email) || self.find_by(email: username_email)
  end
end
