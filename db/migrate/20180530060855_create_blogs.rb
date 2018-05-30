class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.text :status
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
