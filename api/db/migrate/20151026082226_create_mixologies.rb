class CreateMixologies < ActiveRecord::Migration
  def change
    create_table :mixologies do |t|
      t.integer :user_id
      t.integer :cocktail_id
    end
  end
end
