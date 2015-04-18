class AddUserToken < ActiveRecord::Migration
  def change
    add_column :users, :auth_token, :string, :unique => true
  end
end
