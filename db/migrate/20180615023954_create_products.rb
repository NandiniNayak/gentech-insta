class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.float :cost
      t.integer :quantity
      t.references :user, foreign_key: true
      t.references :seller, foreign_key: true

      t.timestamps
    end
  end
end
