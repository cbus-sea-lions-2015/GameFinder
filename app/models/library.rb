class Library < ActiveRecord::Base
  has_many :games_libraries
  has_many :games, through: :games_libraries

  belongs_to :user, inverse_of: :library

  validates :user, presence: true
end
