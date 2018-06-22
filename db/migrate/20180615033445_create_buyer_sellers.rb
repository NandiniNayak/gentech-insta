class CreateBuyerSellers < ActiveRecord::Migration[5.2]
  def change
    create_table :buyer_sellers do |t|
      t.references :user, foreign_key: true
      t.references :seller, foreign_key: true

      t.timestamps
    end
  end
end
