class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :name
      t.text :bio
      t.string :location
      t.date :dob
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
