class User < ActiveRecord::Base

  validates :email, presence: true
  validates :email, :uniqueness => true, :format => { :with => /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/i, :message => "Invalid email format." }
  validates :password_digest, presence: true

  belongs_to :library, inverse_of: :user

  has_secure_password
end
