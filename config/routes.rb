Rails.application.routes.draw do

  root 'welcome#index'
  
  get '/logout', to: 'sessions#destroy', as: :logout

  resources :users
  resources :questionnaires
  resources :sessions
  resources :children
  resources :posts
  resources :groups
  resources :comments
  resources :compatabilities
  resources :memberships

end
