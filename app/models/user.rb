class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates_presence_of :password
  validates_presence_of :password_confirmation
  has_secure_password

  before_create :generate_api_key

  private
  def generate_api_key
    self.api_key = SecureRandom.hex(16)
  end
end