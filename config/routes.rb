Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :submissions, only: [:show] do
    resources :reviews, only: [:new, :create]
  end

  resources :reviews, only: [:index, :show]

  resources :exercices, only: [:index, :show] do
    resources :submissions, only: [:new, :create]
    resources :bookmarks, only: [:create, :destroy]
  end

  resources :users, only: [:index]
end
