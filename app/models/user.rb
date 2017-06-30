require 'bcrypt'

class User

  include BCrypt
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password_digest, Text

  validates_confirmation_of :password

  attr_reader :password
  attr_accessor :password_confirmation

  def password=(password, password_confirmation)
    fail "Passwords do not match" unless valid?(password, password_confirmation)
    self.password_digest = BCrypt::Password.create(password)
  end

  def valid?(password, password_confirmation)
    password == password_confirmation
  end

end
