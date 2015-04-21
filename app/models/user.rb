class User < ActiveRecord::Base

  belongs_to :library, inverse_of: :user

  validates :auth0_id, presence: true, uniqueness: true

end
