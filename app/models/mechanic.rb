class Mechanic < ActiveRecord::Base
  has_many :games_mechanics
  has_many :games, through: :games_mechanics

  validates :bgg_id, uniqueness: true, presence: true
  validates :name, presence: true
end
