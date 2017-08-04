Rails.application.routes.draw do

  root to: 'tasks#index'

  match 'home', to: 'tasks#index', via: :all

  match 'login',   to: 'sessions#new',     via: :get
  match 'logout',  to: 'sessions#destroy', via: :get
  match 'sign_in', to: 'sessions#create',  via: :post

  resources :users,
            :sessions,
            :tasks

end
