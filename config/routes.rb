Rails.application.routes.draw do
  resources :quotes
  root "quotes#random_quote"
  get '/quote', to: "quotes#random_quote"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
