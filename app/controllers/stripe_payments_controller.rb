class StripePaymentsController < ApplicationController

  def create_checkout_session
    
    # seed data for testing with params 
    product = Product.first

    # create a stripe checkout session and redirect to 3D secure form
    # https://stripe.com/docs/api/checkout/sessions
    session = Stripe::Checkout::Session.create({
      payment_method_types: ["card"],
      customer_email: "jenny.rosen@example.com",
      line_items: [{
        price_data: {
          currency: "usd",
          product_data: {
            name: product.title,
            description: product.description,
            images: [product.image],
          },
          unit_amount: product.price * 100,
        },
        quantity: 1,
      }],
      mode: "payment",
      success_url: root_url,
      cancel_url: root_url,
    })
    redirect_to session.url, status: 303
  end
end
