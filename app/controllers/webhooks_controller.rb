class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    payload = request.body.read
    endpoint_secret = Rails.configuration.stripe[:webhook_secret]
    sig_header = request.env["HTTP_STRIPE_SIGNATURE"]
    event = nil

    begin
      event = Stripe::Webhook.construct_event(
        payload, sig_header, endpoint_secret
      )
    rescue JSON::ParserError => e
      render json: { message: e }, status: 400
      return
    rescue Stripe::SignatureVerificationError => e
      render json: { message: e }, status: 400
      return
    end

    # Handle the event
    case event.type
    when "payment_intent.created"
      puts "✅  A payment intent was created for $#{event.data.object.amount}".green.bold
    when "payment_intent.succeeded"
      puts "✅  Payment intent successful".green.bold
    when "customer.created"
      puts "✅  Customer created".green.bold
    when "customer.updated"
      puts "✅  Customer updated".green.bold
    when "charge.succeeded"
      puts "✅  Charge successful!".green.bold
    when "checkout.session.completed"
      puts "✅  Checkout session completed".green.bold
      WebhookMailer.checkout_session_completed(event.data.object).deliver_now
    else
      puts "⚠️  Unhandled event type: #{event.type}".yellow.bold
    end
    render json: { message: "webhook was successful" }, status: 200
  end
end
