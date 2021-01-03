Rails.application.routes.draw do

  # Set Project Root Path #
  root 'static_pages#home'

  # Set Static Page Directories #
  get 'about',        to: 'static_pages#about'
  get 'connect',      to: 'static_pages#connect'
  get 'donate',       to: 'static_pages#donate'
  get 'devlogs',      to: 'static_pages#devlogs'

  # Set User Directories #
  get 'signup',       to: 'users#new'

  # Set Project Resources #
  resources :users
end
