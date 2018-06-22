class BuyerController < ApplicationController
  def page
    @product = Product.find(params[:product_id])
  end
end
