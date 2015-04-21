class AddAuth0Id < ActiveRecord::Migration
  def change
    add_column :users, :auth0_id, :string, :unique => true
    remove_column :users, :auth_token
    remove_column :users, :password_digest
    remove_column :users, :email
  end
end
