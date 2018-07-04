class User < ApplicationRecord
  has_many :posts
  
  before_create :remember
  attr_accessor :remember_token

  has_secure_password

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(string)
    Digest::SHA1.hexdigest(string)
  end

  def remember
    self.remember_token = User.new_token
    self.remember_digest = User.digest(remember_token)
  end
end
