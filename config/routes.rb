SampleApp::Application.routes.draw do
  
  get "users/new"

  root :to => 'pages#home'  # || match '/', :to => '#pages#home'
  match '/home', :to => 'pages#home'
  match 'contact', :to => 'pages#contact'
  match '/about', :to => 'pages#about'
  match '/help', :to => 'pages#help'
  match '/signup', :to => 'users#new'

end