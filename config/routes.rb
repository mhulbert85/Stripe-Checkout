Rails.application.routes.draw do

  root to: 'stripe_payments#index'
  post 'create_checkout_session', to: 'stripe_payments#create_checkout_session'
  
end
