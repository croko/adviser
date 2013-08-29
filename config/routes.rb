Adviser::Application.routes.draw do

  resources :advises, only: [:new, :create]

  concern :commentable do
  resources :comments
  end
  concern :likeable do
  resources :likes, only: [:create]
  end

  resources :clinics, only: [:show, :edit, :update], :concerns => [:commentable, :likeable]
  resources :doctors, only: [:show, :edit, :update], :concerns => [:commentable, :likeable]
  resources :categories, only: [:index, :show]
  resources :photos

  devise_for :admin_users #, :controllers => { :sessions => "admin/sessions" } # :class_name => "AdminUser"# :only => :sessions
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, only: [:edit, :update, :show]

  namespace :admin do
    resources :advises do
      resources :clinics
      resources :doctors
    end
    resources :categories
    resources :clinics
    resources :doctors
    resources :categories
    resources :roles
    resources :users
    resources :admin_users
    resources :photos
    resources :comments
    resources :pages do
      resources :contents, shallow: :true
      resources :ads, shallow: :true
    end
  end

  match '/results', to: 'application#results', via: [:get, :post]
  root to: 'application#main'

end
