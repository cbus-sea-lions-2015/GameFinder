class GamesLibrary < ActiveRecord::Base
  belongs_to :game
  belongs_to :library

  validates :game_id, presence: true
  validates :library_id, presence: true
end
