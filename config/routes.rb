Rails.application.routes.draw do

  root to: 'tasks#index'

  match 'login',  to: 'sessions#new',     via: :get
  match 'logout', to: 'sessions#destroy', via: :get

  resources :users, 
            :sessions, 
            :tasks

end