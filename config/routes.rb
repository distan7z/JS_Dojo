Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :submissions, only: [:show], shallow: true do
    resources :reviews, only: [:create]
  end

  resources :exercices, only: [:index, :show] do
    resources :submissions, only: [:new, :create, :edit, :update]
    resources :bookmarks, only: [:create, :destroy]
  end

  resources :users, only: [:index, :show]
end
