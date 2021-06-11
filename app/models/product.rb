class Product < ApplicationRecord
  # Call create method from redirect_to_checkout PORO
  def create_checkout_session(url)
    Stripe::RedirectToCheckout.new(self, url).create
  end
end
