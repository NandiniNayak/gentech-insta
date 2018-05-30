Rails.application.routes.draw do

  resources :posts
  resources :profiles
  # for omniauth : you get the error: The action 'facebook' could not be found for Devise::OmniauthCallbacksController when you sign up with facebook, to solev this create a call back function for users


devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :publishers
  resources :games
  root 'home#page'
  # root 'devise/sessions#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
