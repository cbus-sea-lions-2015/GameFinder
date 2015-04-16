class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false, :limit => 255
      t.string :password_digest, null: false, :limit => 255
      t.string :name, :limit => 255
      t.string :phone, :limit => 16
      t.string :handle, :limit => 255
      t.string :bgg_username, :limit => 255

      t.timestamps null: false
    end
    add_index :users, :email
  end
end
