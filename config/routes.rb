Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "articles#index"
  resources :searches, only: [:new, :create, :index]
  resources :articles, only: [:index]
  get 'articles/search', to: 'articles#search'
  get 'analysis', to: 'searches#analysis'
end
