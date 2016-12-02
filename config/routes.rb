Rails.application.routes.draw do

  resources :users

  root 'users#new'
  
  #get 'static_pages/home'
  #get 'static_pages/help'
  #get 'static_pages/about'

end
