Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  get "/users", to: "home#index"
  get "/certificate", to: "home#show_certificate"
  devise_for :users
  resource :student, controller: "student"
end
