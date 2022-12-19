Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :scientists
  #, only: [:index, :show, :create, :update, :destroy]
  resources :planets, only: [:index]
  resources :missions, only: [:create]
  # Defines the root path route ("/")
  # root "articles#index"
end
