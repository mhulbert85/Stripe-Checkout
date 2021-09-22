class CheckoutController < ApplicationController

  def create
    
    # product id is passed to the controller from buy now button
    product = Product.find params[:id] 

    # create a stripe checkout session and redirect to 3D secure form
    # https://stripe.com/docs/api/checkout/sessions
    session = Stripe::Checkout::Session.create({
      payment_method_types: ["card"],
      line_items: [{
        price_data: {
          currency: "usd",
          product_data: {
            name: product.title,
            description: product.description,
            images: [product.image_url],
          },
          unit_amount: product.unit_amount,
        },
        quantity: 1,
      }],
      mode: "payment",
      success_url: success_url,
      cancel_url: cancel_url,
    })
    redirect_to session.url, status: 303
  end
end
