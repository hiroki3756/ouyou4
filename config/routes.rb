Rails.application.routes.draw do
  devise_for :users
  resources :books
  resources :relationships, only: [:create, :destroy]
  root 'home#top'
  get 'home/about'
  get 'relationships/index_followings'
  resources :users,only: [:show,:index,:edit,:update] do
    member do
      get :following, :followers
    end
  end
end
