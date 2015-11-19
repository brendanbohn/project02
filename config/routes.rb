Rails.application.routes.draw do

  get 'sessions/new'

  root 'welcome#index'
  

  resources :users
  resources :questionnaires
  resources :sessions
  resources :children

end
