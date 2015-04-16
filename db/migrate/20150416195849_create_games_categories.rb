class CreateGamesCategories < ActiveRecord::Migration
  def change
    create_table :games_categories do |t|
      t.references :game
      t.references :category
    end
  end
end
