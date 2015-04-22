class CreateFavoritelibraries < ActiveRecord::Migration
  def change
    create_table :favoritelibraries do |t|
      t.references :user
      t.references :library
    end
  end
end
