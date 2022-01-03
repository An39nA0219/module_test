Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users
  resources :consultants
  get "consultants/:id/edit_email", to: "consultants#edit_email", as: :edit_consultant_email
  patch "consultants/:id/update_email", to: "consultants#update_email", as: :consultant_email
end
