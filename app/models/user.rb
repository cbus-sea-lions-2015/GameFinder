require 'securerandom'

class User < ActiveRecord::Base
  before_create :set_auth_token

  has_one :library, inverse_of: :user

  validates :email, presence: true
  validates :email, :uniqueness => true, :format => { :with => /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/i, :message => "Invalid email format." }
  validates :password_digest, presence: true
  validates :auth_token, :uniqueness => true

  has_secure_password

  private
    def set_auth_token
      return if auth_token.present?
      self.auth_token = generate_auth_token
    end

    def generate_auth_token
      SecureRandom.uuid.gsub(/\-/,'')
    end

end
