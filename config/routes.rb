Rails.application.routes.draw do

  root to: 'static#index'
  get 'success', to: 'static#success'
  get 'cancel', to: 'static#cancel'
  
  # Stripe Checkout 
  post 'create', to: 'checkout#create', as:"create_checkout_session"

  # Webhooks
  resources :webhooks, only: [:create]
  
end