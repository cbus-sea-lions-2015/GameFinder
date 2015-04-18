class Library < ActiveRecord::Base
  has_many :games_libraries
  has_many :games, through: :games_libraries

  has_many :users

  validates :bgg_username, presence: true
end
