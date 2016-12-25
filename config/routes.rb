Rails.application.routes.draw do
  resources :blogs
  resources :pictures
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :articles

  get '/confirm_email/:email_token/', :to => "users#confirm_email", as: 'confirm_email'
  get '/signup', to: 'registrations#new'
  post '/signup', to: 'registrations#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
