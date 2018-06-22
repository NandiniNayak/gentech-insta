Rails.application.routes.draw do

  post '/tests', to: "tests#create"
  get 'test/page'
  resources :buyer_sellers
  get 'payment/page'
  post 'payment', to: "payment#create"
  get 'buyer/page'
  resources :products
  resources :sellers


  get 'follow/page'

  root 'welcome#page'
  # create a nested routes for attachements in the blogs
  resources :blogs do
    resources :attachments
    member do
      put 'like', to:"blogs#vote"
    end
    resources :comments , only: [:create]
  end
  # resources :attachments
  resources :posts
  resources :profiles
  resources :followings
  # for omniauth : you get the error: The action 'facebook' could not be found for Devise::OmniauthCallbacksController when you sign up with facebook, to solev this create a call back function for users


devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'home/page'

  # root 'devise/sessions#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
