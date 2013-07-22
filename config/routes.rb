Adviser::Application.routes.draw do

  resources :advises, only: [:new, :create]

  concern :commentable do
  resources :comments
  end
  concern :likeable do
  resources :likes, only: [:create]
  end

  resources :clinics, only: [:index, :show, :edit], :concerns => [:commentable, :likeable]
  resources :doctors, only: [:show, :edit, :update], :concerns => [:commentable, :likeable]
  resources :categories, only: [:index, :show]
  resources :photos

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, only: :edit

  namespace :admin do
    resources :advises
    resources :categories
    resources :clinics
    resources :doctors
    resources :categories
    resources :roles
    resources :users
    resources :admin_users
    devise_for :admin_users
    resources :photos
  end

  root to: 'application#main'

end
