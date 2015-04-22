class AddLibraryId < ActiveRecord::Migration
  def change
    add_column :users, :library_id, :integer
    remove_column :users, :bgg_username
  end
end
