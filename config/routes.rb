Rails.application.routes.draw do
  resources :enrollements
  resources :lessons
  devise_for :users
  resources :courses do
    resources :enrollements, only: [:new, :create]
  end
  resources :users, only: [:index, :edit, :show, :update]
  get 'home/activity'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
