module Stripe
  class RedirectToCheckout
    attr_reader :product

    def initialize(product, url)
      @product = product
      @url = url
    end

    def create
      session = Stripe::Checkout::Session.create({
        payment_method_types: ["card"],
        customer_email: "jenny.rosen@example.com",
        line_items: [{
          price_data: {
            currency: "usd",
            product_data: {
              name: @product.title,
              description: @product.description,
              images: [@product.image],
            },
            unit_amount: @product.price * 100,
          },
          quantity: 1,
        }],
        mode: "payment",
        success_url: @url,
        cancel_url: @url,
      })
      { id: session.id }.to_json
      return session.id
    end
  end
end
