Rails.application.routes.draw do

  resources :locations
  resources :meetings
  resources :pets
  resources :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  delete "/sessions/logout", to: 'sessions#logout', as: 'logout'

  get "/sessions/new", to: 'sessions#new', as: 'new_login' 
  post "/sessions/new", to: 'users#new', as: 'signup' 
  post '/sessions/login', to: 'sessions#login', as: 'login'
  get "browse" , to: "pets#browse", as: 'browse'
  

  #mailbox 
  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash


    
  # conversations
  resources :conversations do
    member do
      get :reply 
      post :reply
      post :trash
      post :untrash
    end
  end
  
end
