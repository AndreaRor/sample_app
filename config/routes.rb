SampleApp::Application.routes.draw do
  
  get "relationships/create"

  get "relationships/destroy"

  get "sessions/new"

  root :to => 'pages#home'  # || match '/', :to => '#pages#home'
  
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :sessions, :only => [:new, :create, :destroy]
  resources :microposts, :only => [:create, :destroy]
  resources :relationships, :only => [:create, :destroy]
  resources :commentaires

  match '/home', :to => 'pages#home'
  match 'contact', :to => 'pages#contact'
  match '/about', :to => 'pages#about'
  match '/help', :to => 'pages#help'
  match '/signup', :to => 'users#new'
  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  match '/users/:id/mescommentaires', :to => 'commentaires#mes_commentaires'
  match '/:categorie_nom', :to => 'microposts#post_par_categorie'


end