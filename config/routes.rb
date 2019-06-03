Rails.application.routes.draw do
  root 'static_pages#home'
  
  get '/signup', to: 'users#new'
  get '/help', to: 'static_pages#help'
end
