Rails.application.routes.draw do
  mount Rswag::Ui::Engine => "/api-docs"
  mount Rswag::Api::Engine => "/api-docs"
  devise_for :users,
             controllers: {
               registrations: "users/registrations",
               sessions: "users/sessions"
             }
  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end
  resources :contacts
  resources :wishlists

  root "family_members#index"
  # resources :users

  resources :family_members do
    resources :wishlists
    resources :contacts
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", :as => :rails_health_check

   match "*unmatched", to: "application#not_found_method", via: :all, constraints: lambda { |req| req.path.exclude?('/rails/active_storage/') }

  # Defines the root path route ("/")
  # root "posts#index"
end
