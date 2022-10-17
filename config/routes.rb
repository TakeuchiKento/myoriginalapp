Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
  devise_for :users, controllers: {   registrations: 'users/registrations',sessions: 'users/sessions' }
  resources :users, only:[:index, :show, :edit, :update] do
    member do
      get :follows, :followers
    end
    resource :relationships, only: [:create, :destroy]
  end
  root "tops#index"
  resources :messages, only: [:create]
  resources :dmrooms, only: [:create, :index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'tops' => 'tops#index'
  resources :posts
  get "search" => "searches#index"
  resources :rooms
  resources :letters, :only => [:create]
end
