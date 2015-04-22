class Library < ActiveRecord::Base
  has_many :games_libraries
  has_many :games, through: :games_libraries

  has_many :users

  has_many :favusers, class: "Favoritelibrary"
  has_many :favoriteusers, through: :favusers

  validates :bgg_username, presence: true
end
