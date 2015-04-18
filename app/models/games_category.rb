class GamesCategory < ActiveRecord::Base
  belongs_to :game
  belongs_to :category

  validates :game_id, presence: true
  validates :category_id, presence: true
end
