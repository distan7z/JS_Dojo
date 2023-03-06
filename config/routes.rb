Rails.application.routes.draw do
  get 'dashboards/show'
  get 'exercices/index'
  get 'exercices/show'
  get 'users/index'
  devise_for :users
  root to: "pages#home"
  resources :submissions, only: [:new, :create, :show] do
    resources :reviews, only: [:create]
  end
  resources :exercices, only: [:index, :show] do
    resources :submissions, only: [:new, :create, :show]
    resources :bookmarks, only: [:create, :destroy]
  end
  resources :users, only: [:index]
end
