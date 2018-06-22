class Seller < ApplicationRecord
  # sellers can sell many products and are connected to buyers via the products
  belongs_to :user
  has_many :products
  # just to make coding easy, setting buyers as a method, which corresponds to User class
  has_many :buyers, class_name: 'User', foreign_key: 'user_id', through: :products

  has_and_belongs_to_many :buyers, class_name: 'User', foreign_key: 'user_id'
end
