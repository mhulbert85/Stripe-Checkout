Rails.application.routes.draw do

  root to: 'stripe_payments#index' 
  
  # Stripe Payments
  post 'create_checkout_session', to: 'stripe_payments#create_checkout_session'

  # Webhooks
  resources :webhooks, only: [:create]
  
end
