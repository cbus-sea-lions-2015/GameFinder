class GamesMechanic < ActiveRecord::Base
  belongs_to :game
  belongs_to :mechanic

  validates :game_id, presence: true
  validates :mechanic_id, presence: true
end
