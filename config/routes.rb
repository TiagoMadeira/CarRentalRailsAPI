Rails.application.routes.draw do
  devise_for :users, path: "/api/v1", path_names: {
    sign_in: "login",
    sign_out: "logout",
    registration: "signup"
  },
  controllers: {
  sessions: "api/v1/auth/sessions",
  registrations: "api/v1/auth/registrations"
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api  do
    namespace :v1 do
      get "up" => "rails/health#show", as: :rails_health_check
      resources :vehicles
      resources :rentals, except: [ :index ]
    end
  end


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.


  # Defines the root path route ("/")
  # root "posts#index"
end
