class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [ :create ]

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
      flash.now[:notice] = event.data.object
    when "payment_intent.succeeded"
      flash.now[:notice] = event.data.object
    when "customer.created"
      flash.now[:notice] = event.data.object
    when "customer.updated"
      flash.now[:notice] = event.data.object
    when "charge.succeeded"
      flash.now[:notice] = event.data.object
    when "checkout.session.completed"
      flash.now[:notice] = event.data.object
      WebhookMailer.checkout_session_completed(event.data.object).deliver_now
    else
      puts "Unhandled event type: #{event.type}"
      flash.now[:alert] = event.type
    end
    render json: { message: "webhook was successful" }, status: 200
  end
end
