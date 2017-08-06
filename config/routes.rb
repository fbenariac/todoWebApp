Rails.application.routes.draw do

  devise_for :users
  root to: 'tasks#index'

  match 'home', to: 'tasks#index', via: :all

  resources :tasks

  # Any routes that aren't defined above here go to the 404
  match "*a", to: "application#routing_error", via: :all

end
