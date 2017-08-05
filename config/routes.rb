Rails.application.routes.draw do

  root to: 'tasks#index'

  match 'home',    to: 'tasks#index',      via: :all
  match 'login',   to: 'sessions#new',     via: :get
  match 'logout',  to: 'sessions#destroy', via: :get
  match 'sign_in', to: 'sessions#create',  via: :post

  resources :users,
            :sessions,
            :tasks

  # Any routes that aren't defined above here go to the 404
  match "*a", to: "application#routing_error", via: :all

end
