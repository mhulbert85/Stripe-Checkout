class StripePaymentsController < ApplicationController
  
  def index; end

  def create_checkout_session
    product = Product.first
    session = Stripe::Checkout::Session.create({
      payment_method_types: ["card"],
      customer_email: "jenny.rosen@example.com",
      line_items: [{
        price_data: {
          currency: "usd",
          product_data: {
            name: product.title,
            description: product.description,
            images: [ product.image ],
          },
          unit_amount: product.price * 100,
        },
        quantity: 1,
      }],
      mode: "payment",
      success_url: root_url,
      cancel_url: root_url,
    })
    redirect_to session.url
  end
end
