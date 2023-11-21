Rails.application.routes.draw do
  get 'reviews/new'
  get 'reviews/create'
  get 'reviews/index'
  get 'reviews/delete'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :users do
    resources :gyms
  end

  resources :users do
    resources :memberships
  end

  resources :gyms do
    resources :reviews, only: [:new, :create]
  end
  # Defines te root path route ("/")
  # root "posts#index"
end
