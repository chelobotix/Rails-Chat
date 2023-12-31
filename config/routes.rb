Rails.application.routes.draw do


  root 'pages#home'

  # Pages
  get "home", to: "pages#home"

  # Sessions
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"


  # Users
  get "signup", to: "users#new"
  resources :users, only: [:create, :edit, :update]

  # Messages
  post "message", to: "messages#create"

  # Channel
  mount ActionCable.server, at: '/cable'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
