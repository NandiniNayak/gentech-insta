Rails.application.routes.draw do


  # create a nested routes for attachements in the blogs
  resources :blogs do
    resources :attachments
  end
  # resources :attachments
  resources :posts
  resources :profiles
  # for omniauth : you get the error: The action 'facebook' could not be found for Devise::OmniauthCallbacksController when you sign up with facebook, to solev this create a call back function for users


devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'home#page'

  # root 'devise/sessions#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
