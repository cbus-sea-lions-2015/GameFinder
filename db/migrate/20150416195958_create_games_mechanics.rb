class CreateGamesMechanics < ActiveRecord::Migration
  def change
    create_table :games_mechanics do |t|
      t.references :game
      t.references :mechanic
    end
  end
end
