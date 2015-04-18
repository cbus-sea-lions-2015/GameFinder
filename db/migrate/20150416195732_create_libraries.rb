class CreateLibraries < ActiveRecord::Migration
  def change
    create_table :libraries do |t|
      t.string :bgg_username
    end
  end
end
