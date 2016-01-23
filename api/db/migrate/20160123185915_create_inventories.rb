class CreateInventories < ActiveRecord::Migration[5.0]
  def change
    create_table :inventories do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :ingredient, index: true, foreign_key: true

      t.timestamps
    end
  end
end
