class User < ApplicationRecord
  has_secure_password
  has_many :selections, dependent: :destroy
  has_many :songs, through: :selections
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence: true, length: { in: 2..20 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  before_save do
    self.email.downcase!
  end
  def full_name
    self.first_name + " " + self.last_name
  end
end
