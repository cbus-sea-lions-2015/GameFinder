class NukeUsersTable < ActiveRecord::Migration
  def change
    remove_column :users, :email
    remove_column :users, :password_digest
    add_column :users, :auth0_id, :string
    add_column :users, :email, :string
  end
end
