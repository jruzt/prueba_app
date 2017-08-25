Rails.application.routes.draw do
  root 'home#index'
  get 'make_a_rent',              to: 'movies#make_a_rent'
  get 'my_cart',                  to: 'carts#index'
  post 'cart_line',               to: 'cart_lines#create'
  delete 'cart_line',             to: 'cart_lines#destroy'
  post 'rent',                    to: 'rents#create'
  get 'active_rents',             to: 'rents#index'
  delete 'active_rents',          to: 'rents#destroy'
  resources :movies
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
