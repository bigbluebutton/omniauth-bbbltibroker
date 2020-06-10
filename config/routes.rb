Bbbltibroker::Engine.routes.draw do
  # Handles Omniauth authentication.
  get '/auth/:provider', to: 'sessions#new', as: :omniauth_authorize
  get '/auth/:provider/callback', to: 'sessions#create', as: :omniauth_callback
  get '/auth/failure', to: 'sessions#failure', as: :omniauth_failure
end
