json.extract! product, :id, :name, :cost, :quantity, :user_id, :seller_id, :created_at, :updated_at
json.url product_url(product, format: :json)
