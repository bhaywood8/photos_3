Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace, defaults: { format: :jsonapi } do
    scope module: 'api/v1', as: 'api' do
      resources :follower_requests

      resources :users

    end
    mount VandalUi::Engine, at: '/vandal'
    # your routes go here
  end
  ActiveAdmin.routes(self)
  root :to => "users#index"
  resources :comments
  resources :likes
  resources :photos
  resources :follower_requests
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
