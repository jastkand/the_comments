App::Application.routes.draw do
  root 'posts#index'

  get "autologin/:id" => "users#autologin",  as: :autologin

  # Login system
  get    "login"    => "sessions#new",     as: :login
  delete "logout"   => "sessions#destroy", as: :logout
  get    "signup"   => "users#new",        as: :signup
  post   "sessions" => "sessions#create",  as: :sessions

  resources :posts

  # TheComments routes
  concern   :the_comments, TheComments::RouteConcern.new
  resources :comments, concerns: :the_comments
end
