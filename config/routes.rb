Rails.application.routes.draw do
  get 'sessions/new'

  root 'static_pages#home'
  
  get '/signup', to: 'users#new'
  get '/help', to: 'static_pages#help'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
end
