class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name,                 null: false
      t.text :about
      t.string :authentication_token
      t.string :password_digest,      null: false

      t.timestamps

      t.index :name,                 unique: true
      t.index :authentication_token, unique: true
    end
  end
end
