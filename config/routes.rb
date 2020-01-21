Rails.application.routes.draw do
  devise_for :users
  root 'breweries#index'

  get '/search' => 'breweries#search', :as => 'search_page'
  resources :breweries, only: [:index, :show]
  resources :users, only: :show
end
