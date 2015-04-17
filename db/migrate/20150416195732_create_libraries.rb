class CreateLibraries < ActiveRecord::Migration
  def change
    create_table :libraries do |t|
      t.references :user, null: false
    end
  end
end
