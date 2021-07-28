class WebhooksController < ApplicationController
    skip_before_action :verify_authenticity_token
    
        def create 
    
            payload = request.body.read
            endpoint_secret = Rails.configuration.stripe[:webhook_secret]
            sig_header = request.env['HTTP_STRIPE_SIGNATURE']
            event = nil 
            
            begin 
                event = Stripe::Webhook.construct_event(
                    payload, sig_header, endpoint_secret
                )
            rescue JSON::ParserError => e                
                # Invalid payload 
                render json: {message: e}, status: 400             
                return 
            rescue Stripe::SignatureVerificationError => e
                # Invalid signature
                render json: {message: e}, status: 400
                return 
            end
    
            # Handle the event
            case event.type
            when 'payment_intent.created'
                payment_intent = event.data.object.id
                puts "PaymentIntent #{payment_intent} was created"
            when 'payment_intent.succeeded'
                payment_intent = event.data.object.id 
                puts "PaymentIntent #{payment_intent} was successful"
            when 'customer.created'
                customer_id = event.data.object.id 
                puts "Customer #{customer_id} was created" 
            when 'customer.updated'
                customer_id = event.data.object.id 
                puts "Customer #{customer_id} was updated" 
            when 'charge.succeeded'
                charge_id = event.data.object.id 
                puts "Charge #{charge_id} was successful"
            when 'checkout.session.completed'
                checkout_id = event.data.object.id 
                puts "Checkout session #{checkout_id} completed"
            else
                puts "Unhandled event type: #{event.type}"
            end
            render json: {message: 'success'}, status: 200
        end
     
    end 
    