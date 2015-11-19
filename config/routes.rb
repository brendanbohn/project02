Rails.application.routes.draw do


  root 'welcome#index'
  

  resources :users
  resources :questionnaires
  resources :sessions
  resources :routes
  resources :posts
  resources :groups
  resources :comments

end
