Rails.application.routes.draw do


  root 'welcome#index'
  

  resources :users
  resources :questionnaires
  resources :sessions
  resources :children
  resources :posts
  resources :groups
  resources :comments

end
