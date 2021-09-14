Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  get "/users", to: "home#index"
  get "/certificate", to: "home#show_certificate"
  devise_for :users

  get "/student_create", to: "student#create_form"
  post "/student_create", to: "student#create"

  get "/student_update", to: "student#update_form"
  put "/student_update", to: "student#update"
end
