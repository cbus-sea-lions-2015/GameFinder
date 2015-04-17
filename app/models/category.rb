class Category < ActiveRecord::Base
  has_many :games_categories
  has_many :games, through: :games_categories

  validates :bgg_id, uniqueness: true, presence: true
  validates :name, presence: true
end
