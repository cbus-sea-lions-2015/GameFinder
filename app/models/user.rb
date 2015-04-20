class User < ActiveRecord::Base

  validates :email, presence: true, uniqueness: true
  validates :auth0_id, presence: true, uniqueness: true

  belongs_to :library, inverse_of: :user

end
