class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.text :description
      t.integer :minplaytime
      t.integer :maxplaytime
      t.integer :minplayers
      t.integer :maxplayers
      t.text :poll
      t.string :image_url
      t.string :thumbnail_url
      t.string :bgg_id, null: false

      t.timestamps null: false
    end
  end
end
