class Game < ActiveRecord::Base
  has_many :games_categories
  has_many :categories, through: :games_categories

  has_many :games_mechanics
  has_many :mechanics, through: :games_mechanics

  has_many :games_libraries
  has_many :libraries, through: :games_libraries

  validates :bgg_id, uniqueness: true, presence: true
  validates :name, presence: true
end
