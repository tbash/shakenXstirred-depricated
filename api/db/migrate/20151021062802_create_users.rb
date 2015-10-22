class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name,                null: false, default: ""
      t.string :authentication_token
      t.string :password_digest

      t.timestamps

      t.index :name,                 unique: true
      t.index :authentication_token, unique: true
    end
  end
end
