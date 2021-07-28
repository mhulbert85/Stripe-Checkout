Rails.configuration.stripe = {
  stripe_secret: ENV["STRIPE_SECRET_KEY"],
  webhook_secret: ENV["WEBHOOK_SECRET"],
}

Stripe.api_key = Rails.configuration.stripe[:stripe_secret]
