Rails.configuration.stripe = {
  secret_key: ENV["STRIPE_SECRET_KEY"],
  webhook_secret: ENV["WEBHOOK_SECRET"],
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
