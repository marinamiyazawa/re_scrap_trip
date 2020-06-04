Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root 'homes#top'
  get 'homes/about', to:'homes#about'

  resources :relationships, only: [:create, :destroy]
  resources :users, only: [:show,:index] do
  	member do
  		get :edit_update
  		patch :users_update
  		get :hide
  		patch :hide_update
  		get :following, :followers
  	end
  end
  resources :posts, only: [:new,:create,:index,:show,:edit,:update] do
  	resource :favorites, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
