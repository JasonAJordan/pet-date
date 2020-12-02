Rails.application.routes.draw do

  resources :locations
  resources :meetings
  resources :pets
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  delete "/sessions/logout", to: 'sessions#logout', as: 'logout'

  get "/sessions/new", to: 'sessions#new', as: 'new_login' 
  post '/sessions/login', to: 'sessions#login', as: 'login'

end
