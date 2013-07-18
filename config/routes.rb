Adviser::Application.routes.draw do

  concern :commentable do
  resources :comments
  end

  resources :clinics, :concerns => :commentable

  resources :addresses

  resources :categories

  devise_for :users
  resources :users, only: :edit

  namespace :admin do
    resources :clinics
    resources :addresses
    resources :categories
    resources :roles
    resources :users
    resources :admin_users
    devise_for :admin_users
  end

end
