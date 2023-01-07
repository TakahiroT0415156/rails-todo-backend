Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    namespace :api do
      namespace :v1 do
        resources :posts, only: [:index, :create, :destroy]
        resources :users, only:[:index, :create, :show]
        post "login", to: "sessions#create"
        delete "logout", to: "sessions#destroy"
      end 
    end 
end
