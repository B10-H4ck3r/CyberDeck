Rails.application.routes.draw do

  # Set Project Root Path #
  root 'static_pages#home'

  # Set Static Page Directories #
  get 'about',        to: 'static_pages#about'
  get 'connect',      to: 'static_pages#connect'
  get 'donate',       to: 'static_pages#donate'
  get 'devlogs',      to: 'static_pages#devlogs'

  # Set User Directories #
  get    'signup',   to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'


  # Set Project Resources #
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]


end
