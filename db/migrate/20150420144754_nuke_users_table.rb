class NukeUsersTable < ActiveRecord::Migration
  def change_table :users do |t|
    t.remove :email, :password_digest
    t.string :auth0_id, null: false
    t.string :email
  end
end
