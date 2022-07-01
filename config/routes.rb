
Rails.application.routes.draw do
  resources :orders
  resources :products
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }
  get '/member-data', to: 'members#show'
  get '/users/password/:email', to: 'password#forgot_password'
  post '/update-user', to: 'members#update'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end