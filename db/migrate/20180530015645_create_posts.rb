class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :status
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
