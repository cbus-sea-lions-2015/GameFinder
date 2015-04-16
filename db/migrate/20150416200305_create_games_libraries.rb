class CreateGamesLibraries < ActiveRecord::Migration
  def change
    create_table :games_libraries do |t|
      t.references :game
      t.references :library
    end
  end
end
