Rails.application.routes.draw do

  devise_for :users
  root to: 'application#home'

  match 'home', to: 'application#home', via: :all
  match 'logged_home', to: 'tasks#index', via: :get

  resources :tasks

  # Any routes that aren't defined above here go to the 404
  match '*a', to: 'application#routing_error', via: :all

end
