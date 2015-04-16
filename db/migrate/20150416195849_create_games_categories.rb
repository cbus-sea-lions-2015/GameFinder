class CreateGamesCategories < ActiveRecord::Migration
  def change
    create_table :games_categories do |t|
      t.references :game, null: false
      t.references :category, null: false
    end
  end
end
