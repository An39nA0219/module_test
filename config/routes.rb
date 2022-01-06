Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users
  resources :consultants
  patch "consultants/:id/update_email", to: "consultants#update_email", as: :consultant_email
end
