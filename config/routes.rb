Rails.application.routes.draw do
  root :to => "users#index"
  resources :comments
  resources :likes
  resources :photos
  resources :follower_requests
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
