class ProductsController < ApplicationController
  def index
    @product = Product.first
    url = request.original_url
    @session = @product.create_checkout_session(url) # call create checkout session from product model and store in instance variable
  end
end
