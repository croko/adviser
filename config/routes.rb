Adviser::Application.routes.draw do

  concern :commentable do
  resources :comments
  end

  resources :clinics, only: [:index, :show, :edit], :concerns => :commentable
  #resources :doctors, only: [:index, :show, :edit], :concerns => :commentable

  resources :addresses

  resources :categories

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, only: :edit

  namespace :admin do
    resources :clinics
    #resources :doctors
    resources :addresses
    resources :categories
    resources :roles
    resources :users
    resources :admin_users
    devise_for :admin_users
  end

  root to: 'application#main'

end
