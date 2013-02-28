SampleApp::Application.routes.draw do
  
  root :to => 'pages#home'  # || match '/', :to => '#pages#home'
  match '/home', :to => 'pages#home'
  match 'contact', :to => 'pages#contact'
  match '/about', :to => 'pages#about'
  match '/help', :to => 'pages#help'
  match '/inscription', :to => 'pages#inscription'

end